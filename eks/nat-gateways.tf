resource "aws_nat_gateway" "kubernetes_labs_nat1" {
  allocation_id = aws_eip.kubernetes_labs_nat1

  subnet_id = aws_subnet.kubernetes_labs_public_1

  tags = {
    Name = "main"
  }

}

resource "aws_nat_gateway" "kubernetes_labs_nat2" {
  allocation_id = aws_eip.kubernetes_labs_nat2

  subnet_id = aws_subnet.kubernetes_labs_public_2

  tags = {
    Name = "main"
  }

}