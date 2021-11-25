resource "aws_route_table_association" "pikca_igas_puba" {
  subnet_id = aws_subnet.pika_puba.id
  route_table_id = aws_route_table.pika_rt.id
}

resource "aws_route_table_association" "pikca_igas_pubc" {
  subnet_id = aws_subnet.pika_pubc.id
  route_table_id = aws_route_table.pika_rt.id
}
