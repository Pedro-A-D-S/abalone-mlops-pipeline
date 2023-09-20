output "data_bucket_name" {
  value = aws_s3_bucket.data_bucket.bucket
  description = "The name of the data bucket."
}

output "data_bucket_arn" {
  value = aws_s3_bucket.data_bucket.arn
  description = "The ARN of the data bucket."
}

output "etl_bucket_name" {
  value = aws_s3_bucket.etl_bucket.bucket
  description = "The name of the etl bucket."
}

output "etl_bucket_arn" {
  value = aws_s3_bucket.etl_bucket.arn
  description = "The ARN of the etl bucket."
}