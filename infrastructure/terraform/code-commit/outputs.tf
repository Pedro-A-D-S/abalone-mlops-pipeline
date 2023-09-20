output "id" {
  value = aws_codecommit_repository.mlops.id
  description = "The ID of the CodeCommit repository."
}

output "arn" {
  value = aws_codecommit_repository.mlops.arn
  description = "The ARN of the CodeCommit repository."
}