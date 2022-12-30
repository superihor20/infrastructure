resource "aws_key_pair" "ec2_kp" {
  count      = length(var.file_keys_names)
  key_name   = "ec2-kp-${var.file_keys_names[count.index]}"
  public_key = file("${path.root}/keys/${var.file_keys_names[count.index]}.pub")

  tags = {
    file_name = "File name ${var.file_keys_names[count.index]}.pub"
  }
}