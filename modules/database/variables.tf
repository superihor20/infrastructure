variable "db_settings" {
  description = "Configuration settings"
  type        = map(any)
  default = {
    allocated_storage = 10 // in gigabytes
    engine            = "mysql"
    engine_version    = "8.0.28"
    instance_class    = "db.t3.micro"
    db_name           = "my_db"
    username          = "naidonov"
  }
}

variable "db_subnet_group_id" {
  description = "DB subnet group"
  type        = string
}

variable "db_security_group_ids" {
  description = "Security groups for db"
  type        = list(string)
}