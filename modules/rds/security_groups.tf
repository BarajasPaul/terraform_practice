resource "aws_security_group" "rds" {
  name        = "${var.db_name}-rds-sg"
  description = "Security group for RDS instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol        = "-1"
    security_groups = var.ingress_security_groups
  }

  ingress {
    from_port       = var.db_port
    to_port         = var.db_port
    protocol        = "tcp"
    security_groups = var.ingress_security_groups
  }

}

resource "aws_db_subnet_group" "rds" {
  name       = "${var.db_name}-rds-subnet-group"
  subnet_ids = var.private_subnet_ids
}
