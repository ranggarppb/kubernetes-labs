resource "aws_subnet" "kubernetes_labs_public_1" {
  vpc_id = aws_vpc.kubernetes_labs.id

  cidr_block = "192.168.0.0/18"

  availability_zone = "ap-southeast-1a"

  map_public_ip_on_launch = true

  tags = {
    Name                        = "main-public-1"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "kubernetes_labs_public_2" {
  vpc_id = aws_vpc.kubernetes_labs.id

  cidr_block = "192.168.64.0/18"

  availability_zone = "ap-southeast-1b"

  map_public_ip_on_launch = true

  tags = {
    Name                        = "main-public-2"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "kubernetes_labs_private_1" {
  vpc_id = aws_vpc.kubernetes_labs.id

  cidr_block = "192.168.128.0/18"

  availability_zone = "ap-southeast-1a"

  map_public_ip_on_launch = true

  tags = {
    Name                              = "main-private-1"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}