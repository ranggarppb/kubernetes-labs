resource "aws_internet_gateway" "kubernetes_labs" {
  vpc_id = aws_vpc.kubernetes_labs.id

  tags = {
    Name = "main"
  }
}