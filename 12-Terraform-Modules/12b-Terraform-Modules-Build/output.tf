output "arn" {
  value = aws_s3_bucket.s3_bucket.arn
  description = "ARN of the S3 bucket"
}

output "name" {
  value = aws_s3_bucket.s3_bucket.id
  description = "Bucket ID of the S3 bucket"
}

output "domain" {
  value = aws_s3_bucket.s3_bucket.website_domain
  description = "Domain name of the S3 bucket"
}

output "endpoint" {
  value = aws_s3_bucket.s3_bucket.website_endpoint
  description = "Endpoint information of the S3 bucket"
}