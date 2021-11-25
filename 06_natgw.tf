resource "aws_eip" "pika_ngw_ip" {
  vpc = true
}

resource "aws_nat_gateway" "pika_ngw" {
  allocation_id = aws_eip.pika_ngw_ip.id
  subnet_id = aws_subnet.pika_puba.id
  tags = {
    "Name" = "pika-ngw"
  }
}