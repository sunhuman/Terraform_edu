provider "aws" {
  region = var.region
}

#키페어
resource "aws_key_pair" "pika_key" {
  key_name   = var.key
  public_key = file("../../.ssh/id_rsa.pub")
}


resource "aws_vpc" "pika_vpc" {
  cidr_block           = var.cidr_vpc
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" = "${var.name}-vpc"
  }
}

resource "aws_subnet" "pika_pub" {
  count             = length(var.pub_sub) #2
  vpc_id            = aws_vpc.pika_vpc.id
  cidr_block        = var.pub_sub[count.index]
  availability_zone = "${var.region}${var.ava_zone[count.index]}"
  tags = {
    "Name" = "${var.name}-pub${var.ava_zone[count.index]}"
  }
}

resource "aws_subnet" "pika_pri" {
  count = 2
  vpc_id            = aws_vpc.pika_vpc.id
  cidr_block        = var.pri_sub[count.index]
  availability_zone = "${var.region}${var.ava_zone[count.index]}"
  tags = {
    "Name" = "${var.name}-pri${var.ava_zone[count.index]}"
  }
}

resource "aws_subnet" "pika_pridb" {
  count = 2
  vpc_id            = aws_vpc.pika_vpc.id
  cidr_block        = var.db_sub[count.index]
  availability_zone = "${var.region}${var.ava_zone[count.index]}"
  tags = {
    "Name" = "${var.name}-pridb${var.ava_zone[count.index]}"
  }
}
