resource "aws_instance" "web" {
  count = length(var.web_instances)

  ami                    = var.web_instances[count.index].ami
  instance_type          = var.web_instances[count.index].instance_type
  subnet_id              = var.public_subnets[count.index]
  key_name               = var.key_name
  vpc_security_group_ids = var.web_security_group_ids

  tags = {
    Name = var.web_instances[count.index].tag_name
  }
}