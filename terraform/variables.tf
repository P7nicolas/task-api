variable "aws_region" {
  description = "Região da AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "repository_name" {
  description = "Nome do repositório ECR"
  type        = string
  default     = "task-api"
}