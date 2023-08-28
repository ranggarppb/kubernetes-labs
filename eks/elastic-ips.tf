resource "aws_eip" "kubernetes_labs_nat1" {
  depends_on = [aws_internet_gateway.kubernetes_labs]

  tags = {
    Name = "main"
  }
}

resource "aws_eip" "kubernetes_labs_nat2" {
  depends_on = [aws_internet_gateway.kubernetes_labs]

  tags = {
    Name = "main"
  }
}