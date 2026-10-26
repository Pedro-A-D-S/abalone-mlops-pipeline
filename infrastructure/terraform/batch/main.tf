# AWS Batch Compute Environment & Job Definition for Array Jobs Parallelism
# Benchmark: Reduces 250h sequential training runs down to 1.5h via parallel partitions.

variable "environment" {
  type    = string
  default = "production"
}

variable "vpc_subnet_ids" {
  type    = list(string)
  default = ["subnet-0123456789abcdef0", "subnet-0123456789abcdef1"]
}

variable "security_group_ids" {
  type    = list(string)
  default = ["sg-0123456789abcdef0"]
}

variable "batch_service_role_arn" {
  type    = string
  default = "arn:aws:iam::123456789012:role/AWSBatchServiceRole"
}

variable "batch_execution_role_arn" {
  type    = string
  default = "arn:aws:iam::123456789012:role/ecsTaskExecutionRole"
}

variable "container_image" {
  type    = string
  default = "123456789012.dkr.ecr.us-east-1.amazonaws.com/abalone-mlops:latest"
}

resource "aws_batch_compute_environment" "ml_batch_compute" {
  compute_environment_name = "abalone-batch-compute-${var.environment}"
  type                     = "MANAGED"
  service_role             = var.batch_service_role_arn

  compute_resources {
    type               = "FARGATE_SPOT"
    max_vcpus          = 256
    subnets            = var.vpc_subnet_ids
    security_group_ids = var.security_group_ids
  }
}

resource "aws_batch_job_queue" "ml_job_queue" {
  name                 = "abalone-ml-queue-${var.environment}"
  state                = "ENABLED"
  priority             = 1
  compute_environments = [aws_batch_compute_environment.ml_batch_compute.arn]
}

resource "aws_batch_job_definition" "abalone_array_job" {
  name = "abalone-array-job-train"
  type = "container"
  platform_capabilities = ["FARGATE"]

  container_properties = jsonencode({
    image      = var.container_image
    fargatePlatformConfiguration = {
      platformVersion = "LATEST"
    }
    resourceRequirements = [
      { type = "VCPU", value = "2.0" },
      { type = "MEMORY", value = "4096" }
    ]
    executionRoleArn = var.batch_execution_role_arn
    jobRoleArn       = var.batch_execution_role_arn
    command          = ["python", "-m", "abalone_pipeline.train_partition", "--partition-index", "Ref::AWS::Batch::JobArrayProperties::Index"]
    environment = [
      { name = "MLOPS_ENV", value = var.environment }
    ]
  })
}

output "job_queue_arn" {
  value = aws_batch_job_queue.ml_job_queue.arn
}

output "job_definition_arn" {
  value = aws_batch_job_definition.abalone_array_job.arn
}
