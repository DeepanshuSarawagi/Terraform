policy "check-terraform-version" {
  source = ".\\terraform_version.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "restrict-s3-bucket" {
  source = ".\\restrict_s3_bucket.sentinel"
  enforcement_level = "soft-mandatory"
}