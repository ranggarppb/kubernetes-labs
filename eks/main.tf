module "terraform_eks_labs" {
  source  = "ranggarppb/eks-labs/aws"
  version = "0.1.1"

  region             = var.region
  availability_zones = var.availability_zones
  aws_user_id        = var.aws_user_id
  cluster_name       = var.cluster_name
}