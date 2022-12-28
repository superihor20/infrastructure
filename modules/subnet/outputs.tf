output "public_subnet_ids" {
  description = "The IDs of the public subnet"
  value       = aws_subnet.public_subnet.*.id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnet"
  value       = aws_subnet.private_subnet.*.id
}

output "db_subnet_group_id" {
  description = "The id of DB subnet group"
  value       = aws_db_subnet_group.db_sg.id
}