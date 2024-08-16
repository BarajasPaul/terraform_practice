variable "project_name" {
    description = "project name"
    type = string
}

variable "enable_dns_support" {
    type    = bool
    default = true
}

variable "enable_dns_hostnames" {
    type    = bool
    default = true
}

variable "environment" {
  description = "environment"
    type = string
    default = ""
}

variable "cidr_block" {
  description = "cidr_block"
    type = string
    default = ""
}