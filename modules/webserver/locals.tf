locals {
  region = "us-east-1"
  http_port    = 80
  any_port     = 0
  any_protocol = "-1"
  tcp_protocol = "tcp"
  open_cidr = ["0.0.0.0/0"]
  tags = {
    Example    = var.project_name
    GithubRepo = "terraform_practice"
  }
}