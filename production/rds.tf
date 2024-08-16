module "terraform_database" {
  source = "../modules/rds"
  project_name = "terraform_practice"
  vpc_id = module.terraform_vpc.vpc_id
  ingress_security_groups = [module.terraform_vpc.security_group_id]
  private_subnet_ids      = slice(module.terraform_vpc.private_subnet_ids, 0, 2)
  db_port                        = 5432
  db_engine                      = "postgres"
  db_engine_version              = "16.3"
  db_instance_class              = "db.t3.micro"
  db_allocated_storage           = 20
  db_storage_type                = "gp2"
  db_name                        = "terraform_practice"
  db_username                    = var.rds_db_username
  db_password                    = var.rds_db_password
  db_skip_final_snapshot         = true
  db_multi_az                    = false
}