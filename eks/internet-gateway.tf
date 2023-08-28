resource "aws_internet_gateway" "main" {
	vpc_id = aws_vpc.kubernetes_labs.id

	tags = {
	  Name = "main"
	}
}