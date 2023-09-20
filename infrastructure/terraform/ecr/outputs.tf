output "id" {
  value = module.ecr_repository.id
  description = "The ID of the ECR repository."
}

output "arn" {
  value = module.ecr_repository.arn
  description = "The ARN of the ECR repository."
}