locals {
  owners      = var.business_division
  environment = var.environment
  name        = "${local.owners}-${local.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
  eks_cluster_name = "${local.name}-${var.cluster_name}"
}