resource "aws_key_pair" "pika_key" {
  key_name = "pika-key"
  public_key = file("../../.ssh/id_rsa.pub")
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDB+CDtmMF4neUmH7LDGQLbSDccsJG3wqXwdPOnQfgEBGx2oXr0UhkFP7l2Ag3fGZZZ6miNc74TNJmT6vTznTeWXEOyDSk5aQGgtLhP32eOlc5O3URobd/FRukR60sk5BAtfQQnABeIZ0lf7w/DK6YeshfuBfoi91kBHs6n17chJY1rKkwgNJAUCIV+G9LNfT+eeYwWWsXtOoje4BeVuIgEHZY8xqPO3mKx0mm3hXttOKA4B0rKItoXSNqEzfaxLh1/+bw7Tm20qCQqFrqKpePZwkF3zw3Z/4y8xmsQdbOqvXydDLVtLRnCvsMDZWGGtKCrRNoEB+jqomKum0GmtMkelLCUIj+99PR/opMiqNuf4eMVOZBpKln7+tkD7uToDqN/+4X9w6jIPnMr+vUv/UqVNZUaWBh+hB+Sz2nDxi2PiFqYFohbTPPkeQHbx/A/arjWxz0hC6exSnU8v+84FX+jjcrLjZ99BI6qz6ZQbEpiAgXwP0XCZLzoQ54Jm+TuZh8="
}