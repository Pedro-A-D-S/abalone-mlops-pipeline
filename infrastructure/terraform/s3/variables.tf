variable "data_bucket_name" {
    type = string
    description = "The name of the data bucket."
    default = "data-us-east-2"
}

variable "etl_bucket_name" {
    type = string
    description = "The name of the etl bucket."
    default = "mlops-us-east-2"
}