resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  description = "Security group for databases"

  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = local.ingress_db

    content {
      description     = ingress.value.description
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      security_groups = ingress.value.security_groups
    }
  }

  depends_on = [
    aws_security_group.web_sg
  ]

  tags = {
    Name = "db_sg"
  }
}