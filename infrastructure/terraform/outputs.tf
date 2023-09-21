output "cloud9_id" {
  value = module.cloud9.id
  description = "The ID of the Cloud9 environment."
}

output "cloud9_arn" {
  value = module.cloud9.arn
  description = "The ARN of the Cloud9 environment."
}

output "codecommit_repository_id" {
  value = module.codecommit_repository.id
  description = "The ID of the CodeCommit repository."
}

output "codecommit_repository_arn" {
  value = module.codecommit_repository.arn
  description = "The ARN of the CodeCommit repository."
}

output "ecr_repository_id" {
  value = module.ecr_repository.id
  description = "The ID of the ECR repository."
}

output "ecr_repository_arn" {
  value = module.ecr_repository.arn
  description = "The ARN of the ECR repository."
}