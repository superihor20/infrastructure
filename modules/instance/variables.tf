variable "web_instances" {
  description = "Settings for instances"
  type        = list(map(any))
  default = [{
    ami           = "ami-830c94e3"
    instance_type = "t2.micro"
    tag_name      = "naidonov-instance"
  }]
}

variable "public_subnets" {
  description = "Public subnet ids"
  type        = list(string)
}

variable "key_name" {
  description = "Key for access with SSH"
  type        = string
}

variable "web_security_group_ids" {
  description = "Security groups for web"
  type        = list(string)
}
