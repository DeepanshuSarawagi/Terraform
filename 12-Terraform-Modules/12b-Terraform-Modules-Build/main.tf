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
                  "Version": "2012-10-17",
                  "Id": "Policy1667898386224",
                  "Statement": [
                      {
                          "Sid": "Stmt1667898378183",
                          "Effect": "Allow",
                          "Principal": "*",
                          "Action": "s3:GetObject",
                          "Resource": "arn:aws:s3:::${var.bucket_name}/*"
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
}