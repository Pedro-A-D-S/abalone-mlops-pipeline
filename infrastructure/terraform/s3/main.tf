resource "aws_s3_bucket" "data_bucket" {
    bucket = var.data_bucket_name
    acl = "private"
    versioning {
        enabled = true
    }
}

resource "aws_s3_bucket" "etl_bucket" {
    bucket = var.etl_bucket_name
    acl = "private"
    versioning {
        enabled = true
    }
}