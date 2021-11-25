resource "aws_route_table" "pika_rt" {
  vpc_id = aws_vpc.pika_vpc.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.pika_ig.id
  }
  tags = {
    "Name" = "pika-rt"
  }
}