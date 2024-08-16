# VPC creation
resource "aws_vpc" "main" {
  cidr_block = local.vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = local.tags
}