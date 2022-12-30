resource "aws_key_pair" "ec2_kp" {
  key_name   = "ec2-kp-${var.file_name}"
  public_key = file("${path.root}/keys/${var.file_name}.pub")

  tags = {
    file_name = "File name ${var.file_name}.pub"
  }
}