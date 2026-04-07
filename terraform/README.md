# Terraform submission for Particle41 assignment

### Steps to create Terraform AWS resources
 - initiate backend (S3 + DynamoDB) by going into /terraform/backend then `terraform init` & `terraform apply`
 - come back to /terraform and execute `terraform init`, `terraform plan`, `terraform apply`

### Achievements
 - The Terraform code uses a detached architecture so that external configurations can be given at any time
 - S3 + DynamoDB is used for state locking
 - Modules used for reusability of code
