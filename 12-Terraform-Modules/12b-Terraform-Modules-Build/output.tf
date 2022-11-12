output "arn" {
  value       = module.website_s3_bucket.arn
  description = "ARN of the S3 bucket"
}

output "name" {
  value       = module.website_s3_bucket.name
  description = "Bucket ID of the S3 bucket"
}

output "domain" {
  value       = module.website_s3_bucket.domain
  description = "Domain name of the S3 bucket"
}

output "endpoint" {
  value       = module.website_s3_bucket.endpoint
  description = "Endpoint information of the S3 bucket"
}