variable "rds_db_password" {
  description = "RDS database password"
  type        = string
}

variable "rds_db_username" {
  description = "RDS database username"
}
variable "db_name" {
  description = "Database namne"
  type        = string
}

variable "db_instance_type" {
  description = "Database Instace type"
  type        = string
  default     = "db.t2.micro"
}