resource "aws_internet_gateway" "pika_ig" {
  vpc_id = aws_vpc.pika_vpc.id
  
  tags = {
    "Name" = "pika-ig"
  }
}