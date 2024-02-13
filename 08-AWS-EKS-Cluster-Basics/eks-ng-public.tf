# Terraform manifest to create EKS nodegroup in public subnet

resource "aws_eks_node_group" "eks_public_ng"  {

  cluster_name = aws_eks_cluster.eks_cluster.name
  node_group_name = "${local.name}-eks-ng-public"
  node_role_arn = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids = module.vpc.public_subnets
  version = var.cluster_version

  scaling_config = {
    desired_size = 1
    min_size = 1
    max_size = 2
  }

}
