output "ecr_repository_name" {
  description = "Nome do repositorio ECR"
  value       = aws_ecr_repository.task_api.name
}

output "ecr_repository_url" {
  description = "URL do repositorio ECR"
  value       = aws_ecr_repository.task_api.repository_url
}

output "ec2_instance_id" {
  description = "ID da instancia EC2"
  value       = aws_instance.task_api.id
}

output "ec2_public_ip" {
  description = "IP publico da instancia EC2"
  value       = aws_instance.task_api.public_ip
}

output "ec2_public_dns" {
  description = "DNS publico da instancia EC2"
  value       = aws_instance.task_api.public_dns
}

output "security_group_id" {
  description = "ID do Security Group da task-api"
  value       = aws_security_group.task_api.id
}