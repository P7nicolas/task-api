output "ecr_repository_name" {
  description = "Nome do repositório ECR"
  value       = aws_ecr_repository.task_api.name
}

output "ecr_repository_url" {
  description = "URL do repositório ECR"
  value       = aws_ecr_repository.task_api.repository_url
}