resource "aws_route_table_association" "pika_ngwass_pria" {
  subnet_id = aws_subnet.pika_pria.id
  route_table_id = aws_route_table.pika-ngwrt.id
}

resource "aws_route_table_association" "pika_ngwass_pric" {
  subnet_id = aws_subnet.pika_pric.id
  route_table_id = aws_route_table.pika-ngwrt.id
}

resource "aws_route_table_association" "pika_ngwass_pridba" {
  subnet_id = aws_subnet.pika_pridba.id
  route_table_id = aws_route_table.pika-ngwrt.id
}

resource "aws_route_table_association" "pika_ngwass_pridbc" {
  subnet_id = aws_subnet.pika_pridbc.id
  route_table_id = aws_route_table.pika-ngwrt.id
}