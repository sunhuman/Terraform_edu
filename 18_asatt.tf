resource "aws_autoscaling_attachment" "pika_asatt" {
  autoscaling_group_name = aws_autoscaling_group.pika_atsg.id
  alb_target_group_arn = aws_lb_target_group.pika_albtg.arn
}