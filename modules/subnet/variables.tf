variable "subnet_amount" {
  description = "Number of subnets"
  type        = map(number)
  default = {
    public  = 1,
    private = 2
  }
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_cidr_blocks" {
  description = "Public CIDR block of the desired subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "private_subnet_cidr_blocks" {
  description = "Private CIDR block of the desired subnet"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}