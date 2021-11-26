resource "aws_ami_from_instance" "pika_ami" {
  name = "pika-ami"
  source_instance_id = aws_instance.pika_web.id
  depends_on = [
    aws_instance.pika_web
  ]
}