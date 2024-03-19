data "terraform_remote_state" "eks" {
  backend = "local"
  config = {
    path = "../08-AWS-EKS-Cluster-Basics/terraform.tfstate"
  }
}

data "aws_eks_cluster" "cluster" {
  name = data.terraform_remote_state.eks.outputs.cluster_id
}

data "aws_eks_cluster_auth" "cluster_auth" {
  name = data.terraform_remote_state.eks.outputs.cluster_id
}