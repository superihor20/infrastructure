output "instance_ids" {
  description = "EC2 instance ids"
  value       = aws_instance.web[*].id
}

output "web_instances" {
  description = "Settings for instances"
  value       = var.web_instances
}