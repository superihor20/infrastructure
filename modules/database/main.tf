resource "aws_db_instance" "db" {
  allocated_storage      = var.db_settings.allocated_storage
  engine                 = var.db_settings.engine
  engine_version         = var.db_settings.engine_version
  instance_class         = var.db_settings.instance_class
  db_name                = var.db_settings.db_name
  username               = var.db_settings.username
  password               = random_password.db_initial_password.result
  db_subnet_group_name   = var.db_subnet_group_id
  vpc_security_group_ids = var.db_security_group_ids

  depends_on = [
    random_password.db_initial_password
  ]
}