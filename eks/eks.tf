resource "aws_eks_cluster" "kubernetes_labs" {
  name = "kubernetes_labs"

  role_arn = aws_iam_role.kubernetes_labs.arn

  version = "1.27"

  vpc_config {
    endpoint_private_access = false

    endpoint_public_access = true

    subnet_ids = [
      aws_subnet.kubernetes_labs_public_1.id,
      aws_subnet.kubernetes_labs_public_2.id,
      aws_subnet.kubernetes_labs_private_1.id,
      aws_subnet.kubernetes_labs_private_2.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.kubernetes_labs]
}