resource "aws_launch_configuration" "pika_lacf" {
  name = "pika-lacf"
  image_id = aws_ami_from_instance.pika_ami.id
  instance_type = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.pika_sg.id]
  key_name = "pika-key"
  user_data =<<-EOF
                #!/bin/bash
                systemctl start httpd
                systemctl enable httpd
                EOF
}