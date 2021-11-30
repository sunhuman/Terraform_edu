resource "aws_db_instance" "pika_db" {
  allocated_storage = var.allocated_storage
  storage_type = var.storage_type
  engine = var.mysql
  engine_version = var.engine_ver
  instance_class = var.db_ins
  name = var.db_name
  identifier = var.db_iden
  username = var.db_user
  password = var.db_passwd
  parameter_group_name = var.db_pgn
  availability_zone = "${var.region}${var.ava_zone[0]}"
  db_subnet_group_name = aws_db_subnet_group.pika_dbsg.id
  vpc_security_group_ids = [aws_security_group.pika_sg.id]
  skip_final_snapshot = true
  tags = {
    "Name" = var.db_name
  }
}

resource "aws_db_subnet_group" "pika_dbsg" {
  name = "${var.name}-dbsg"
  subnet_ids = [aws_subnet.pika_pridb[0].id,aws_subnet.pika_pridb[1].id]
  tags = {
    "Name" = "${var.name}-dbsg"
  }
}