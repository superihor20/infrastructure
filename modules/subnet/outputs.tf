output "public_subnet_ids" {
  description = "The IDs of the public subnet"
  value       = ["${aws_subnet.public_subnet.*.id}"]
}

output "private_subnet_ids" {
  description = "The IDs of the private subnet"
  value       = ["${aws_subnet.private_subnet.*.id}"]
}