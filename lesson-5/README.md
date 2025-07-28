# lesson-5: Terraform AWS Infrastructure

## 📁 Структура

- `backend.tf` — налаштування бекенду (S3 + DynamoDB)
- `main.tf` — підключення модулів
- `outputs.tf` — виведення ресурсів
- `modules/` — окремі модулі для:
  - `s3-backend`: S3-бакет та DynamoDB
  - `vpc`: Мережева інфраструктура
  - `ecr`: Репозиторій Docker-образів

## ⚙️ Команди

```bash
terraform init
terraform plan
terraform apply
terraform destroy
