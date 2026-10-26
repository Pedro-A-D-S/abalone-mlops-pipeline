terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
}

module "s3" {
  source = "./s3"
}

module "ecr" {
  source = "./ecr"
}

module "iam" {
  source = "./iam"
}

module "batch" {
  source = "./batch"
}

module "step_functions" {
  source                   = "./step_functions"
  batch_job_queue_arn      = module.batch.job_queue_arn
  batch_job_definition_arn = module.batch.job_definition_arn
}

module "self_serve_api" {
  source            = "./self_serve_api"
  step_function_arn = module.step_functions.state_machine_arn
}
