provider "aws" {

  assume_role_with_web_identity {
	role_arn = "arn:aws:iam::020612890700:role/gha_oidc_assume_role"
	web_identity_token_file = "/tmp/awscreds"
  }

  region = "ap-southeast-1"
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
