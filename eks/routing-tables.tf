resource "aws_route_table" "kubernetes_labs_public" {
  vpc_id = aws_vpc.kubernetes_labs.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kubernetes_labs.id
  }

  tags = {
    Name = "main-public"
  }
}

resource "aws_route_table" "kubernetes_labs_private_1" {
  vpc_id = aws_vpc.kubernetes_labs.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.kubernetes_labs_nat1.id
  }

  tags = {
    Name = "main-private-1"
  }
}

resource "aws_route_table" "kubernetes_labs_private_2" {
  vpc_id = aws_vpc.kubernetes_labs.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.kubernetes_labs_nat2.id
  }

  tags = {
    Name = "main-private-2"
  }
}