resource "aws_security_group" "pika_sg" {
  name        = "${var.name}-sg"
  description = "HTTP,SSH,SQL,ICMP"
  vpc_id      = aws_vpc.pika_vpc.id

  ingress = [
    {
      description      = var.http
      from_port        = var.port_http
      to_port          = var.port_http
      protocol         = var.pro_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = var.ssh
      from_port        = var.port_ssh
      to_port          = var.port_ssh
      protocol         = var.pro_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = var.mysql
      from_port        = var.port_mysql
      to_port          = var.port_mysql
      protocol         = var.pro_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = var.icmp
      from_port        = var.port_zero
      to_port          = var.port_zero
      protocol         = var.icmp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]

  egress = [
    {
      description      = var.all
      from_port        = var.port_zero
      to_port          = var.port_zero
      protocol         = var.minus
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]
  tags = {
    "Name" = "${var.name}-sg"
  }
}

data "aws_ami" "amzn" {
  most_recent = true

  filter {
    name   = var.f-name
    values = [var.ami]
  }

  filter {
    name   = var.f-type
    values = [var.v-type]
  }

  owners = [var.owner]
}

resource "aws_instance" "pika_web" {
  ami                    = data.aws_ami.amzn.id
  instance_type          = var.ins_type
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.pika_sg.id]
  availability_zone      = "${var.region}${var.ava_zone[0]}"
  private_ip             = var.pri_ip
  subnet_id              = aws_subnet.pika_pub[0].id
  user_data              = file("./wordpressinstall.sh")

  tags = {
    "Name" = "${var.name}-web"
  }
}

resource "aws_eip" "pika_web_ip" {
  vpc                       = true
  instance                  = aws_instance.pika_web.id
  associate_with_private_ip = var.pri_ip
  depends_on                = [aws_internet_gateway.pika_ig]
}

