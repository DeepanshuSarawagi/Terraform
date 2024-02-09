# 08-AWS-EKS-Cluster-Basics

## IAM Role and policies

We need to create one STS assumable service for EKS cluster. The EKS cluster will assume this role and perform actions on 
node groups.

Following Policies provided by AWS can be attached to this role.

- AmazonEKSClusterPolicy
- AmazonEKSVPCResourceController

Refer to [iam-eks-cluster](iam-eks-cluster.tf) terraform manifest for details.

We also need to create EKS node group roles. This allows Amazon EKS worker nodes to connect to Amazon EKS Clusters.

Following policies provided by Amazon EKS can be attached to this role.

- AmazonEKSWorkerNodePolicy
- AmazonEKS_CNI_Policy
- AmazonEC2ContainerRegistryReadOnly

Refer to [iam-eks-nodegroup.tf](iam-eks-nodegroup.tf) terraform manifest for more details.