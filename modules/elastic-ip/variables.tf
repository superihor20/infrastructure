variable "instance_ids" {
  description = "EC2 instance ids"
  type        = list(string)
}

variable "web_instances" {
  description = "Settings for instances"
  type        = list(map(any))
}