# AWS Step Functions State Machine orchestrating distributed batch training and model registration

variable "environment" {
  type    = string
  default = "production"
}

variable "role_arn" {
  type    = string
  default = "arn:aws:iam::123456789012:role/StepFunctionsExecutionRole"
}

variable "batch_job_queue_arn" {
  type = string
}

variable "batch_job_definition_arn" {
  type = string
}

variable "array_size" {
  type    = number
  default = 50
  description = "Number of concurrent batch array partitions executed"
}

resource "aws_sfn_state_machine" "distributed_ml_pipeline" {
  name     = "abalone-distributed-batch-pipeline-${var.environment}"
  role_arn = var.role_arn

  definition = jsonencode({
    Comment = "Distributed ML Training Pipeline: 250h to 1.5h using AWS Batch Array Jobs"
    StartAt = "LaunchBatchArrayTraining"
    States = {
      LaunchBatchArrayTraining = {
        Type     = "Task"
        Resource = "arn:aws:states:::batch:submitJob.sync"
        Parameters = {
          JobName       = "abalone-partition-train"
          JobQueue      = var.batch_job_queue_arn
          JobDefinition = var.batch_job_definition_arn
          ArrayProperties = {
            Size = var.array_size
          }
        }
        Next = "EvaluateModelQuality"
      }
      EvaluateModelQuality = {
        Type = "Choice"
        Choices = [
          {
            Variable      = "$.Status"
            StringEquals  = "SUCCEEDED"
            Next          = "PublishModelCandidateEvent"
          }
        ]
        Default = "PipelineFailed"
      }
      PublishModelCandidateEvent = {
        Type     = "Task"
        Resource = "arn:aws:states:::events:putEvents"
        Parameters = {
          Entries = [
            {
              Source       = "custom.abalone.mlops"
              DetailType   = "ModelCandidateReady"
              Detail = {
                "ModelVersion.$" = "$.ModelVersion"
                "R2Score.$"      = "$.Metrics.R2"
                "Environment"    = var.environment
              }
            }
          ]
        }
        End = true
      }
      PipelineFailed = {
        Type  = "Fail"
        Cause = "Batch Array training partition failed"
        Error = "BatchExecutionFailed"
      }
    }
  })
}

output "state_machine_arn" {
  value = aws_sfn_state_machine.distributed_ml_pipeline.arn
}
