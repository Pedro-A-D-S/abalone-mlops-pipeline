variable "region" {
    type = string
    description = "The AWS region to create the Cloud9 environment."
    default = "us-east-2"
}

variable "aws_access_key_id" {
  type = string
  description = "The AWS access key ID to use."
  default = ""
}

variable "aws_secret_access_key" {
  type = string
  description = "The AWS secret access key to use."
  default = ""
}