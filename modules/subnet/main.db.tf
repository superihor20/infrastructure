resource "aws_db_subnet_group" "db_sg" {
  name        = "db_subnet_group"
  description = "DB subnet group for private subnet groups"
  subnet_ids  = [for subnet in aws_subnet.private_subnet : subnet.id]

  depends_on = [
    aws_subnet.private_subnet
  ]
}