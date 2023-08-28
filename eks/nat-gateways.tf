resource "aws_nat_gateway" "kubernetes_labs_nat1" {
  allocation_id = aws_eip.kubernetes_labs_nat1.id

  subnet_id = aws_subnet.kubernetes_labs_public_1.id

  tags = {
    Name = "main"
  }

}

resource "aws_nat_gateway" "kubernetes_labs_nat2" {
  allocation_id = aws_eip.kubernetes_labs_nat2.id

  subnet_id = aws_subnet.kubernetes_labs_public_2.id

  tags = {
    Name = "main"
  }

}