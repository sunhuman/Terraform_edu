# 가용영역 a의 public subnet
resource "aws_subnet" "pika_puba" {
  vpc_id = aws_vpc.pika_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "pika-puba"
  }
}

#가용영역 c의 public subnet
resource "aws_subnet" "pika_pubc" {
  vpc_id = aws_vpc.pika_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "pika-pubc"
  }
}

#가용영역 a의 private subnet
resource "aws_subnet" "pika_pria" {
  vpc_id = aws_vpc.pika_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "pika-pria"
  }
}

#가용영역 c의 private subnet
resource "aws_subnet" "pika_pric" {
  vpc_id = aws_vpc.pika_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "pika-pric"
  }
}

#가용영역 a의 DB subnet
resource "aws_subnet" "pika_pridba" {
  vpc_id = aws_vpc.pika_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "pika-pridba"
  }
}

#가용영역 c의 DB subnet
resource "aws_subnet" "pika_pridbc" {
  vpc_id = aws_vpc.pika_vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "pika-pridbc"
  }
}