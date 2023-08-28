resource "aws_eks_node_group" "kubernetes_labs_workers" {
  cluster_name = aws_eks_cluster.kubernetes_labs.name

  node_group_name = "kubernetes_labs_workers"

  node_role_arn = aws_iam_role.kubernetes_labs_workers.arn

  // workers only deployed on private subnet, while load balancer is on public subnet
  subnet_ids = [
    aws_subnet.kubernetes_labs_private_1.id,
    aws_subnet.kubernetes_labs_private_2.id
  ]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  ami_type = "AL2_x86_64"

  capacity_type = "SPOT"

  disk_size = 20

  force_update_version = false

  instance_types = ["t3.small"]

  labels = {
    role = "workers"
  }

  depends_on = [
    aws_iam_role_policy_attachment.kubernetes_labs_workers_general,
    aws_iam_role_policy_attachment.kubernetes_labs_workers_ecr_policy,
    aws_iam_role_policy_attachment.kubernetes_labs_workers_cni_policy
  ]
}