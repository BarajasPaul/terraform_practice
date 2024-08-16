output "rds_host" {
  description = "RDS endpoint"
  value       = aws_db_instance.rds.endpoint
}

output "rds_port" {
  description = "RDS port"
  value       = aws_db_instance.rds.port
}
