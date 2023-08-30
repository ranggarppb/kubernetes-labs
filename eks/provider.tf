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
	"| jq '.' | {body: .http.response.body}"
  ]
}

provider "kubernetes" {
  host = aws_eks_cluster.kubernetes_labs.endpoint
  cluster_ca_certificate = base64decode(jsondecode(data.external.cluster_ca_certificate.result.body)["cluster"]["certificateAuthority"]["data"])
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
