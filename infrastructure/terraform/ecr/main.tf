module "ecr_repository" {
  source = "hashicorp/aws/ecr"
  version = "~> 4.0"

  name = "abalone"
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    ManagedBy = "Terraform"
  }
}