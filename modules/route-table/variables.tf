variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string

  validation {
    condition     = can(regex("^vpc-", var.vpc_id))
    error_message = "The vpc_id value must be a valid VPC id, starting with \"vpc-\""
  }
}

variable "route_cidr_block" {
  description = "The CIDR block of the route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "igw_id" {
  description = "The ID of the Internet Gateway"
  type        = string
}

variable "subnet_amount" {
  description = "Number of subnets"
  type        = map(number)
}

variable "public_subnet_ids" {
  description = "The IDs of the public subnet"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "The IDs of the private subnet"
  type        = list(string)
}