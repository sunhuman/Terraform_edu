output "instance_ip" {
  value = aws_instance.pika_web.public_ip
}

output "dns_name" {
  value = aws_lb.pika_alb.dns_name
}