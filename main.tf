# Kubernetes provider
# https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster#optional-configure-terraform-kubernetes-provider
# To learn how to schedule deployments and services using the provider, go here: https://learn.hashicorp.com/terraform/kubernetes/deploy-nginx-kubernetes
# The Kubernetes provider is included in this file so the EKS module can complete successfully. Otherwise, it throws an error when creating `kubernetes_config_map.aws_auth`.
# You should **not** schedule deployments and services in this workspace. This keeps workspaces modular (one for provision EKS, another for scheduling Kubernetes resources) as per best practices.
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

# The following generates a unique name to use for the cluster_name
resource "random_uuid" "eks_id" {
}

locals {
  # In some cases when applying changes, the aws provider will attempt to create a new cluster with the new state before deleting the old one.  This requires the cluster name to be unique.
  # Avoids this Error: error creating EKS Cluster (wortech-eks-dev): ResourceInUseException: Cluster already exists with name: wortech-eks-dev
  cluster_name = "wortech-${random_uuid.eks_id.result}-dev"
}
