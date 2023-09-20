module "cloud9" {
    source = "hashicorp/aws/cloud9"
    version = "~> 4.0"

    name = "mlops"
    description = "mlops environment"
    instance_type = "t2.micro"
    platform = "amazonlinux2"
    timeout = 30

    aws_managed_temporary_credentials = false

    aws_credentials_block {
        access_key = var.aws_access_key_id
        secret_key = var.aws_secret_access_key
    }

    ssm_managed = true
    region = var.region

    iam_role_arn = module.iam.arn
}