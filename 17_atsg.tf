resource "aws_placement_group" "pika_pg" {
  name     = "pika-pg"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "pika_atsg" {
  name                      = "pika-atsg"
  min_size                  = 2
  max_size                  = 10
  health_check_grace_period = 60
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.pika_lacf.name
  #placement_group           = aws_placement_group.pika_pg.id
  vpc_zone_identifier       = [aws_subnet.pika_puba.id, aws_subnet.pika_pubc.id]

}
