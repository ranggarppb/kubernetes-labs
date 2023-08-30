module "terraform_eks_labs" {
  source = "github.com/ranggarppb/terraform-eks-labs.git"

  region             = "ap-southeast-1"
  availability_zones = ["ap-southeast-1a", "ap-southeast-1b"]
  aws_user_id        = "020612890700"
}