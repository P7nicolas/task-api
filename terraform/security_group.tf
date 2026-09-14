resource "aws_security_group" "task_api" {
  name        = "task-api-sg"
  description = "Security Group da aplicacao task-api"
  vpc_id      = "vpc-0a5f12ac7f3ea867f"

  ingress {
    description = "Acesso HTTP a aplicacao Flask"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Permite saida para a Internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "task-api-sg"
    Project = "task-api"
  }
}