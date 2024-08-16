data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_launch_configuration" "ubuntu_instance" {
  image_id        = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.webapp_instance.id]

  user_data = templatefile("${path.module}/script.sh", {
    server_port = var.server_port
    db_address  = var.db_host
    db_port     = var.db_port
  })

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "webapp_asg" {
  launch_configuration = aws_launch_configuration.ubuntu_instance.name
  vpc_zone_identifier  = var.aws_subnets_ids
  target_group_arns    = [aws_lb_target_group.asg.arn]
  health_check_type    = "ELB"

  min_size = var.min_size
  max_size = var.max_size

  tag {
    key                 = "Name"
    value               = var.project_name
    propagate_at_launch = true
  }
}
