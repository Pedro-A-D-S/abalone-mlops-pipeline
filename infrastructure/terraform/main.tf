module "cloud9" {
  source = "./cloud9"
  name = "mlops"
  description = "mlops environment"
  instance_type = "t2.micro"
  platform = "amazonlinux2"
  timeout = 30
  ssm_managed = true
  region = var.region

  # Assign the IAM role to the Cloud9 environment
  iam_role_arn = module.iam.arn
}

module "codecommit_repository" {
  source = "./codecommit"
  repository_name = "mlops"
  description = "mlops demo"
}

module "ecr_repository" {
  source = "./ecr"
  name = "abalone"
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    ManagedBy = "Terraform"
  }
}