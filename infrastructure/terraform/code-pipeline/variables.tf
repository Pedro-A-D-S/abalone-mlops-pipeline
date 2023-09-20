variable "stack_name" {
  description = "Name of the AWS CloudFormation stack."
}

variable "image_repo_name" {
  description = "Name of the ECR repo without the image name."
  default     = "abalone"
}

variable "image_tag_name" {
  description = "Name of the ECR image tag."
  default     = "latest"
}

variable "model_name" {
  description = "Name of the model."
  default     = "abalone"
}

variable "role_name" {
  description = "Name of the Pipeline execution Role."
  default     = "MLOps"
}
