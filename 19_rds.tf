resource "aws_db_instance" "pika_db" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t2.micro"
  name = "pikadb"
  identifier = "pikadb"
  username = "pika"
  password = "wlsldjtm5"
  parameter_group_name = "default.mysql8.0"
  availability_zone = "ap-northeast-2a"
  db_subnet_group_name = aws_db_subnet_group.pika_dbsg.id
  vpc_security_group_ids = [aws_security_group.pika_sg.id]
  skip_final_snapshot = true
  tags = {
    "Name" = "pikadb"
  }
}

resource "aws_db_subnet_group" "pika_dbsg" {
  name = "pika-dbsg"
  subnet_ids = [aws_subnet.pika_pridba.id,aws_subnet.pika_pridbc.id]
  tags = {
    "Name" = "pika-dbsg"
  }
}