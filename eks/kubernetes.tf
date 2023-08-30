locals {
  map_roles = [
    {
      rolearn  = "arn:aws:iam::020612890700:role/eks-workers"
      username = "system:node:{{EC2PrivateDNSName}}"
      groups = [
        "system:bootstrappers",
        "system:nodes"
      ]
    }
  ]
  map_users = [
    {
      userarn  = "arn:aws:iam::020612890700:root"
      username = "ranggarppb"
      groups = [
        "system:masters"
      ]
    }
  ]
}

resource "kubernetes_config_map" "kubernetes_labs" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
    labels    = {}
  }

  count = 1

  data = {
    mapRoles = yamlencode(local.map_roles)
    mapUsers = yamlencode(local.map_users)
  }

  depends_on = [aws_eks_cluster.kubernetes_labs]
}

resource "kubernetes_cluster_role" "kubernetes_labs_reader" {
  metadata {
    name = "reader"
  }

  rule {
    api_groups = [""]
    resources  = ["deployments", "configmaps", "pods", "secrets", "services"]
    verbs      = ["get", "list", "watch"]
  }
}
