data "tls_certificate" "github" {
  url = "https://token.actions.githubusercontent.com/.well-known/openid-configuration"
}

resource "aws_iam_openid_connect_provider" "github_actions" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.github.certificates[0].sha1_fingerprint]
}

resource "aws_iam_role" "gha_oidc_assume_role" {
  name = "gha_oidc_assume_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "${aws_iam_openid_connect_provider.github_actions.arn}"
        },
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "StringEquals" : {
            "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com",
          },
          "StringLike" : {
            "token.actions.githubusercontent.com:sub" : ["repo:ranggarppb/kubernetes-labs:*"]
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "gha_oidc_terraform_permissions" {
  name = "gha_oidc_terraform_permissions"
  role = aws_iam_role.gha_oidc_assume_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "iam:*",
          "s3:*",
          "eks:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

output "role_arn" {
  value = aws_iam_role.gha_oidc_assume_role.arn
}

