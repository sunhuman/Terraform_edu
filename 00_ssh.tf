resource "aws_key_pair" "pika_key" {
  key_name = "pika-key"
  public_key = file("../../.ssh/id_rsa.pub")
}