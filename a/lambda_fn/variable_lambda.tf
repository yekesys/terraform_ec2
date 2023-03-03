
variable "lambda_function_name" {
  description = "The name of the lambda function"
  type        = string
}


variable "s3_bucket_name" {
  description = "The name of the S3 bucket.  Currently, it is an existing bucket, until I am able to create one with terraform"
  type        = string
}



