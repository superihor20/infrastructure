resource "aws_secretsmanager_secret" "db_secret" {
  name = "db-password"
}

resource "aws_secretsmanager_secret_version" "db_secret_value" {
  secret_id = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username             = aws_db_instance.db.username
    password             = aws_db_instance.db.password
    engine               = aws_db_instance.db.engine
    host                 = aws_db_instance.db.endpoint
    port                 = aws_db_instance.db.port
    dbname               = aws_db_instance.db.db_name
    dbInstanceIdentifier = aws_db_instance.db.identifier
  })

  depends_on = [
    aws_secretsmanager_secret.db_secret,
    aws_db_instance.db
  ]
}

