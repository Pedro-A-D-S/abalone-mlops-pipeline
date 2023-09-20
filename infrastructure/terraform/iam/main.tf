module "iam" {
  source = "hashicorp/aws/iam"
  version = "~> 4.0"

  name = "mlops-demo"
  description = "Allows EC2 instances to call AWS services on your behalf."
  assume_role_policy = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
  policies = ["AdministratorAccess"]
}