provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  shared_config_files      = ["~/.aws/config"]
  profile                  = "ranggarppb"
  region                   = "ap-southeast-1"
}

terraform {
  backend "s3" {
	profile = "ranggarppb"
	key     = "github-action-oidc/terraform.tfstate"
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
