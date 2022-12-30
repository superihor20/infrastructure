output "db_security_group_ids" {
  description = "Security group for the DB"
  value       = aws_security_group.db_sg[*].id
}

output "web_security_group_ids" {
  description = "Security group for the web"
  value       = aws_security_group.web_sg[*].id
}