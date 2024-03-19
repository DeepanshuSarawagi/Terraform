data "terraform_remote_state" "eks" {
  backend = "local"
  config = {
    path = "../08-AWS-EKS-Cluster-Basics/terraform.tfstate"
  }
}