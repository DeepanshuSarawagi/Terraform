# Terraform manifest to create EKS nodegroup in public subnet

resource "aws_eks_node_group" "eks_public_ng" {

  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${local.name}-eks-ng-public"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = module.vpc.public_subnets
  version         = var.cluster_version
  ami_type        = "AL2_x86_64"
  capacity_type   = "ON_DEMAND"
  disk_size       = 30
  instance_types  = ["t3.medium"]

  # Access block for Node group

  remote_access {
    ec2_ssh_key = var.instance_keypair
  }

  scaling_config {
    desired_size = 2
    min_size     = 2
    max_size     = 4
  }

  update_config {
    max_unavailable = 1

  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly,
  ]

  tags = merge({
    Name = "Public-Node-Group"
  }, local.common_tags)
}