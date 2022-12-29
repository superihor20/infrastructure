resource "random_password" "db_initial_password" {
  length           = 20
  special          = true
  min_special      = 5
  min_numeric      = 5
  min_upper        = 5
  override_special = "_!%^"
}