locals {
  region = "us-west-1"
  name = "terraform_practice"
  tags = {
    Example    = var.project_name
    env = var.environment
    GithubRepo = "terraform_practice"
  }
}