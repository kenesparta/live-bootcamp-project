locals {
  ubuntu_22_ami_id = "ami-0e0dab2e7d3136219" # Amazon Linux 2023 (kernel-6.12)
  instance_type    = "t2.micro"
}

resource "aws_key_pair" "main_key" {
  key_name   = "aws-cert-key"
  public_key = var.ec2_key_pair
}

resource "aws_eip" "application_host" {
  domain = "vpc"

  tags = {
    Name    = "application-host"
    Project = var.project
    Owner   = var.owner
  }
}

resource "aws_instance" "application_host" {
  ami           = local.ubuntu_22_ami_id
  instance_type = local.instance_type
  subnet_id     = aws_subnet.public_1.id
  vpc_security_group_ids = [
    aws_security_group.public_ec2_sg.id,
  ]
  key_name  = aws_key_pair.main_key.key_name
  user_data = file("${path.module}/scripts/user-data.sh")

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 20
    delete_on_termination = true
    encrypted             = true

    tags = {
      Name    = "application-host-root-volume"
      Project = var.project
      Owner   = var.owner
    }
  }

  tags = {
    Name    = "application-host-instance"
    Project = var.project
    Owner   = var.owner
  }
}

resource "aws_eip_association" "application_host" {
  instance_id   = aws_instance.application_host.id
  allocation_id = aws_eip.application_host.id
}
