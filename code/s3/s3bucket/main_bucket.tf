



resource "aws_s3_bucket" "git-bucket" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_acl" "git-bucket-acl" {
  bucket = aws_s3_bucket.git-bucket.id
  acl    = "private"
}



resource "aws_s3_bucket" "website-bucket" {
  bucket = var.s3_website_bucket
}


resource "aws_s3_bucket_website_configuration" "website-bucket-config" {

  bucket = var.s3_website_bucket

#  policy = file("policy.json")

# needs work
  policy = jsonencode ({
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${bucket}/*"    # needs work here
    }
  ]
})

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}


resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.website-bucket.id

  # Because all are false, this section is not needed
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}




