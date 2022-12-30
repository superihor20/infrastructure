resource "aws_eip" "web_eip" {
  count    = length(var.web_instances)
  instance = var.instance_ids[count.index]
  vpc      = true

  tags = {
    Name = "web_eip_${count.index}"
  }
}