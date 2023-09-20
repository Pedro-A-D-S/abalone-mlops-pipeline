resource "aws_codepipeline" "codepipeline" {
  name = var.stack_name

  artifact_store {
    location = "mlops-${local.region}-${local.account_id}"
    type     = "S3"
  }

  role_arn = aws_iam_role.codepipeline_role.arn

  stage {
    name = "Source"

    action {
      name            = "ModelSource"
      category        = "Source"
      owner           = "AWS"
      provider        = "CodeCommit"
      version         = "1"
      configuration = {
        BranchName     = "master"
        RepositoryName = "mlops"
        PollForSourceChanges = true
      }
      output_artifacts = ["ModelSourceOutput"]
      run_order        = 1
    }

    # Add other source actions here
  }

  # Add stages and actions for Build, ETL, Training, Deployment, and System Test here
}

# Define your IAM role and other resources here

locals {
  region     = "us-east-1"  # Replace with your desired AWS region
  account_id = "123456789012"  # Replace with your AWS account ID
}
