resource "aws_ami_from_instance" "pika_ami" {
  name = "${var.name}-ami"
  source_instance_id = aws_instance.pika_web.id
  depends_on = [
    aws_instance.pika_web
  ]
}

resource "aws_launch_configuration" "pika_lacf" {
  name = "${var.name}-lacf"
  image_id = aws_ami_from_instance.pika_ami.id
  instance_type = var.ins_type
  iam_instance_profile = var.role
  security_groups = [aws_security_group.pika_sg.id]
  key_name = "${var.name}-key"
  user_data =<<-EOF
                #!/bin/bash
                systemctl start httpd
                systemctl enable httpd
                EOF
}

resource "aws_placement_group" "pika_pg" {
  name     = "${var.name}-pg"
  strategy = var.pla-group
}

resource "aws_autoscaling_group" "pika_atsg" {
  name                      = "${var.name}-atsg"
  min_size                  = var.min_size
  max_size                  = var.max_size
  health_check_grace_period = var.health_gp
  health_check_type         = var.health_type
  desired_capacity          = var.disired-capacity
  force_delete              = false
  launch_configuration      = aws_launch_configuration.pika_lacf.name
  #placement_group           = aws_placement_group.pika_pg.id
  vpc_zone_identifier       = [aws_subnet.pika_pub[0].id, aws_subnet.pika_pub[1].id]
  #target_group_arns = [aws_lb_target_group.pika_albtg.arn]
}

resource "aws_autoscaling_attachment" "pika_asatt" {
  autoscaling_group_name = aws_autoscaling_group.pika_atsg.id
  alb_target_group_arn = aws_lb_target_group.pika_albtg.arn
}
