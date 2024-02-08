# 08-AWS-EKS-Cluster-Basics

## IAM Role and policies

We need to create one STS assumable service for EKS cluster. The EKS cluster will assume this role and perform actions on 
node groups.

Following Policies provided by AWS can be attached to this role.

- AmazonEKSClusterPolicy
- AmazonEKSVPCResourceController

Refer to [iam-eks-cluster](iam-eks-cluster.tf) terraform manifest for details.