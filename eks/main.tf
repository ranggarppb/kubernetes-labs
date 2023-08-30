module "terraform_eks_labs" {
  source = "github.com/ranggarppb/terraform-eks-labs.git"

  region             = var.region
  availability_zones = var.availability_zones
  aws_user_id        = var.aws_user_id
  cluster_name       = var.cluster_name
}