# Змінні для ECR

variable "ecr_repository_name" {
  description = "Назва ECR репозиторію"
  type        = string
}

variable "allow_account_id" {
  description = "ID AWS-акаунта, якому дозволено доступ"
  type        = string
}
