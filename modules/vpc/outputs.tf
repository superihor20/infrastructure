output "vpc_arn" {
  description = "Amazon Resource Name (ARN) of VPC"
  value       = aws_vpc.main.arn
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}