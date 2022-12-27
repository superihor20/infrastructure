variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string

  validation {
    condition     = can(regex("^vpc-", var.vpc_id))
    error_message = "The vpc_id value must be a valid VPC id, starting with \"vpc-\""
  }
}

variable "my_ip" {
  description = "My computer ip"
  type        = string
}


