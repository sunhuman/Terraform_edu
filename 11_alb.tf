resource "aws_lb" "pika_alb" {
  name = "pika-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.pika_sg.id]
  subnets = [aws_subnet.pika_puba.id,aws_subnet.pika_pubc.id]
  tags = {
    "Name" = "pika-alb"
  }
}