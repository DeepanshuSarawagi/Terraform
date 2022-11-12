resource "aws_s3_bucket" "s3_bucket" {
  bucket        = var.bucket_name
  tags          = var.bucket_tags
  force_destroy = true # This will destroy the resource even if the bucket is not empty
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = <<EOF
                {
                "Id": "Policy1667905055756",
                "Version": "2012-10-17",
                "Statement": [
                  {
                    "Sid": "Stmt1667905043931",
                    "Action": [
                      "s3:GetObject",
                      "s3:PutObject"
                    ],
                    "Effect": "Allow",
                    "Resource": "arn:aws:s3:::${var.bucket_name}/*",
                    "Principal": "*"
                  }
                ]
              }
          EOF
}

resource "aws_s3_bucket_website_configuration" "aws_s3_bucket_website" {
  bucket = aws_s3_bucket.s3_bucket.id
  index_document {
    suffix = "product-landing-page.html"
  }
  depends_on = [aws_s3_object.aws_s3_bucket_object]
}

resource "aws_s3_object" "aws_s3_bucket_object" {
  bucket = aws_s3_bucket.s3_bucket.id
  key    = "product-landing-page.html"
  source = var.bucket_static_website_source
  content_type = "text/html"
  acl = "public-read"
  etag = filemd5("${path.cwd}/${var.bucket_static_website_source}")
  depends_on = [aws_s3_bucket.s3_bucket, aws_s3_bucket_acl.s3_bucket_acl, aws_s3_bucket_policy.s3_bucket_policy]
}