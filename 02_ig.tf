resource "aws_internet_gateway" "pika_ig" {
  vpc_id = aws_vpc.pika_vpc.id
  
  tags = {
    "Name" = "${var.name}-ig"
  }
}

resource "aws_route_table" "pika_rt" {
  vpc_id = aws_vpc.pika_vpc.id
  route {
      cidr_block = var.cidr_route
      gateway_id = aws_internet_gateway.pika_ig.id
  }
  tags = {
    "Name" = "${var.name}-rt"
  }
}

resource "aws_route_table_association" "pikca_igas_pub" {
  count = 2
  subnet_id = aws_subnet.pika_pub[count.index].id
  route_table_id = aws_route_table.pika_rt.id
}
