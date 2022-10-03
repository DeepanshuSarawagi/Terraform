resource "aws_s3_bucket" "bucket" {
  for_each = {
    dev  = "dev-bucket"
    qa   = "qa-bucket"
    uat  = "uat-bucket"
    prod = "prod-bucket"
  }
  bucket = "deepanshu-my-${each.value}"
  tags = {
    Name        = "${each.value}"
    Environment = "${each.key}"
  }
}

resource "aws_s3_bucket_acl" "bucket-acl" {
  for_each = aws_s3_bucket.bucket
  bucket   = each.value.id
  acl      = "private"
}