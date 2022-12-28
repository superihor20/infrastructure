output "db_security_group_ids" {
  description = "Security group for the DB"
  value       = aws_security_group.db_sg[*].id
}