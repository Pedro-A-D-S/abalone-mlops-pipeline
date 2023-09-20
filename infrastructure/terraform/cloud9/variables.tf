variable "region" {
    type = string
    description = "The AWS region to create the Cloud9 environment."
    default = "us-east-2"
}

variable "aws_access_key_id" {
  type = string
  description = "The AWS access key ID to use."
  default = "AKIA3DRQDML4P5IYXME5"
}

variable "aws_secret_access_key" {
  type = string
  description = "The AWS secret access key to use."
  default = "oHszpci1N6nJvjPehcFRYXfBfE3rgDgMgMMxyy1D"
}