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

Sample aws-auth configMap:

```yaml
apiVersion: v1
data:
  mapRoles: |
    - groups:
      - system:bootstrappers
      - system:nodes
      rolearn: arn:aws:iam::xxxxxxxxxxxx:role/CLOUD-dev-eks-nodegroup-role
      username: system:node:{{EC2PrivateDNSName}}
  mapUsers: |
    - groups:
      - system:masters
      userarn: arn:aws:iam::xxxxxxxxxxx:user/terraform-eks
      username: terraform-eks
    - groups:
      - system:masters
      userarn: arn:aws:iam::xxxxxxxxxx:root
kind: ConfigMap
metadata:
  creationTimestamp: "2024-02-13T14:38:30Z"
  name: aws-auth
  namespace: kube-system
  resourceVersion: "10056"
  uid: 32bc0aba-6a1c-472c-aea4-6b1d2f0e8e43
```