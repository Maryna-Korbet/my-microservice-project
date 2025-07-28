# Виведення URL репозиторію ECR

output "ecr_repository_url" {
  description = "URL ECR репозиторію"
  value       = aws_ecr_repository.main.aws_ecr_repository
}
