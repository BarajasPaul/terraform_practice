module "terraform_vpc" {
  source               = "../modules/vpc"
  project_name = "terraform_practice"
  environment = "production"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

module "terraform_webserver" {
  source = "../modules/webserver"
  project_name = "terraform practice"
  aws_subnets_ids = [module.terraform_vpc.subnet_ids]

  instance_type = "m5.xlarge"
  min_size      = 2
  max_size      = 10
  db_host = module.terraform_database.rds_host
  db_port = module.terraform_database.rds_port
}