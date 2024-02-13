resource "aws_eks_cluster" "eks_cluster" {
  name     = "${local.name}-${var.cluster_name}"
  role_arn = aws_iam_role.eks_master_role.arn
  version = var.cluster_version
  vpc_config {
    subnet_ids = module.vpc.public_subnets
    endpoint_private_access = var.cluster_endpoint_private_access
    endpoint_public_access = var.cluster_endpoint_public_access
    public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  }
  kubernetes_network_config {
    service_ipv4_cidr = var.kubernetes_service_ipv4_cidr
  }

  # Enable EKS control plane logging

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceController
  ]

  tags = local.common_tags
}

resource "aws_cloudwatch_log_group" "eks_cluster_log_group_retention" {
  name = "/aws/eks/${aws_eks_cluster.eks_cluster.name}/cluster"
  log_group_class = "INFREQUENT_ACCESS"
  retention_in_days = 7
}