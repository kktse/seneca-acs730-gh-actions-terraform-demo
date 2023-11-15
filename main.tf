resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

data "aws_ami" "amazon_linux2" {
    owners  = ["amazon"]
  most_recent = true
  filter {
       name   = "name"
    values =     ["amzn2-ami-hvm-*-arm64-gp2"]
  }
}

resource "aws_key_pair" "development" {
  key_name   = var.development_instance_arguments.key_name
  public_key = file(var.development_instance_arguments.key_name)
}

resource "aws_instance" "development" {
  ami             = data.aws_ami.amazon_linux2
  instance_type   = var.development_instance_arguments.instance_type
  key_name        = aws_key_pair.development.key_name
  security_groups = [aws_security_group.allow_ssh.id]
}

resource "aws_security_group" "development" {
  name        = "Development instance security group"
  description = "Security group rules for the development instance"
  vpc_id      = aws_default_vpc.default_vpc.id
}

