
locals {
  region = "us-west-1"
  vpc_cidr = "10.0.0.0/16"
  open_cidr = "0.0.0.0/0"
  azs      = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  tags = {
    Example    = var.project_name
    GithubRepo = "terraform_practice"

  }
}