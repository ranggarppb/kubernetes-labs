resource "aws_iam_role" "kubernetes_labs" {
  name = "eks-cluster"

  assume_role_policy = <<POLICY
{
"Version": "2012-10-17"
"Statement": [
	{
		"Effect": "Allow",
		"Principal": {
			"Service": "eks.amazonaws.com"
		}
		"Action": "sts:AssumeRole"
	}
]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "kubernetes_labs" {
  policy_arn = "arn:aws:iam:aws:policy/AmazonEKSClusterPolicy"

  role = aws_iam_role.kubernetes_labs.name
}

resource "aws_iam_role" "kubernetes_labs_workers" {
  name = "eks-workers"

  assume_role_policy = <<POLICY
{
"Version": "2012-10-17"
"Statement": [
	{
		"Effect": "Allow",
		"Principal": {
			"Service": "ec2.amazonaws.com"
		}
		"Action": "sts:AssumeRole"
	}
]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "kubernetes_labs_workers_general" {
  policy_arn = "arn:aws:iam:aws:policy/AmazonEKSWorkerNodePolicy"

  role = aws_iam_role.kubernetes_labs_node_groups.name
}

resource "aws_iam_role_policy_attachment" "kubernetes_labs_workers_cni_policy" {
  policy_arn = "arn:aws:iam:aws:policy/AmazonEKS_CNI_Policy"

  role = aws_iam_role.kubernetes_labs_node_groups.name
}

resource "aws_iam_role_policy_attachment" "kubernetes_labs_workers_ecr_policy" {
  policy_arn = "arn:aws:iam:aws:policy/AmazonEC2ContainerRegistryReadOnly"

  role = aws_iam_role.kubernetes_labs_node_groups.name
}