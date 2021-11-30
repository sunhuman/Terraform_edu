resource "aws_lb" "pika_alb" {
  name = "${var.name}-alb"
  internal = false
  load_balancer_type = var.app
  security_groups = [aws_security_group.pika_sg.id]
  subnets = [aws_subnet.pika_pub[0].id,aws_subnet.pika_pub[1].id]
  tags = {
    "Name" = "${var.name}-alb"
  }
}



resource "aws_lb_target_group" "pika_albtg" {
  name     = "${var.name}-albtg"
  port     = var.port_http
  protocol = var.HTTP
  vpc_id   = aws_vpc.pika_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = var.h-thres
    interval            = var.h-interval
    matcher             = var.health
    path                = var.heal_path
    port                = var.tra_port
    protocol            = var.HTTP
    timeout             = var.h-timeout
    unhealthy_threshold = var.unh-thres
  }
}

resource "aws_lb_listener" "pika_alblis" {
  load_balancer_arn = aws_lb.pika_alb.arn
  port = var.port_http
  protocol = var.HTTP

  default_action {
      type = var.forward
      target_group_arn = aws_lb_target_group.pika_albtg.arn
  }
}
