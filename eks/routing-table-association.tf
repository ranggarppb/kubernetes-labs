resource "aws_route_table_association" "kubernetes_labs_public_1" {
  subnet_id      = aws_subnet.kubernetes_labs_public_1
  route_table_id = aws_route_table.kubernetes_labs_public
}

resource "aws_route_table_association" "kubernetes_labs_public_2" {
  subnet_id      = aws_subnet.kubernetes_labs_public_2
  route_table_id = aws_route_table.kubernetes_labs_public
}

resource "aws_route_table_association" "kubernetes_labs_private_1" {
  subnet_id      = aws_subnet.kubernetes_labs_private_1
  route_table_id = aws_route_table.kubernetes_labs_private_1
}

resource "aws_route_table_association" "kubernetes_labs_private_2" {
  subnet_id      = aws_subnet.kubernetes_labs_private_2
  route_table_id = aws_route_table.kubernetes_labs_private_2
}