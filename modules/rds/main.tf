
resource "aws_db_parameter_group" "postgres" {
  family = "postgres16"
  name   = "${var.db_name}-postgres16-params"
  
  description = "Custom parameter group for PostgreSQL 16"

  parameter {
    name         = "max_connections"
    value        = "100"
    apply_method = "pending-reboot"
  }
}

resource "aws_db_instance" "rds" {
  identifier           = var.db_name
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  allocated_storage    = var.db_allocated_storage
  storage_type         = var.db_storage_type
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = aws_db_parameter_group.postgres.name

  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name   = aws_db_subnet_group.rds.name

  skip_final_snapshot = var.db_skip_final_snapshot
  multi_az            = var.db_multi_az
  tags = local.tags
}