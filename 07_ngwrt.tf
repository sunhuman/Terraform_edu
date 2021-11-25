resource "aws_route_table" "pika-ngwrt" {
  vpc_id = aws_vpc.pika_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.pika_ngw.id
  }
  tags = {
    "Name" = "pika-ngwrt"
  }
}