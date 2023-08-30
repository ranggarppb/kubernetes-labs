provider "aws" {
  region = "ap-southeast-1"
}

data "external" "cluster_ca_certificate" {
  program = [
    "aws",
    "eks",
    "describe-cluster",
    "--name",
    "${aws_eks_cluster.kubernetes_labs.name}",
    "--query",
    "cluster.certificateAuthority | jq -r '.' | {data: .data}"
  ]
}

provider "kubernetes" {
  host                   = aws_eks_cluster.kubernetes_labs.endpoint
  cluster_ca_certificate = base64decode(data.external.cluster_ca_certificate.result.data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.kubernetes_labs.name]
    command     = "aws"
  }
  config_path = "~/.kube/config"
}

terraform {
  backend "s3" {
    key     = "eks/terraform.tfstate"
    bucket  = "kubernetes-labs"
    region  = "ap-southeast-1"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
