provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_vpc" "pika_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" = "pika-vpc"
  }
}
