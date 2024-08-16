variable "project_name" {
    description = "project name"
    type = string
}

variable "environment" {
  description = "environment"
    type = string
    default = ""
}

variable "instance_type" {
  description = "EC2 Instances types"
  type        = string
}

variable "min_size" {
  description = "Minimum EC2 Instances"
  type        = number
}

variable "max_size" {
  description = "Maximum EC2 Instances "
  type        = number
}

variable "server_port" {
  description = "HTTP requests"
  type        = number
  default     = 8080
}

variable "aws_subnets_ids" {
  type = list
  description = "webapp subnets"
}

variable "db_host" {
  type = list
  description = "Database hostname"
}

variable "db_port" {
  type = list
  description = "Database expose port"
}