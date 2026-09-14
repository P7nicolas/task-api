resource "aws_instance" "task_api" {
  ami           = "ami-025d99823a4caad37"
  instance_type = "t3.micro"

  subnet_id = "subnet-01d2d63dd6d31ef58"

  vpc_security_group_ids = [
    aws_security_group.task_api.id
  ]

  iam_instance_profile = aws_iam_instance_profile.task_api_ec2.name

  user_data = <<-EOF
              #!/bin/bash

              apt-get update -y
              apt-get install -y docker.io

              systemctl enable docker
              systemctl start docker

              usermod -aG docker ubuntu
              EOF

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name    = "task-api"
    Project = "task-api"
  }
}