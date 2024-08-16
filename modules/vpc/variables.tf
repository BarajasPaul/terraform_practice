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


variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"

}

variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"

}

variable "azs" {
 type        = list(string)
 description = "Availability Zones"
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