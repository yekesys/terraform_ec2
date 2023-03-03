



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

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}






