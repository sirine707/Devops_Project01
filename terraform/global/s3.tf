provider "aws" {
  region = "eu-west-3"
  access_key = var.access_key
  secret_key = var.secret_key
  
}
variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
  
}
resource "aws_s3_bucket" "terraform_state_prod" {
  bucket = "terraform-up-and-running-coolstuff-prod"
 
  # Prevent accidental deletion of this S3 bucket
  
}
resource "aws_s3_bucket_server_side_encryption_configuration" "default_prod" {
  bucket = aws_s3_bucket.terraform_state_prod.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_prod" {
  bucket                  = aws_s3_bucket.terraform_state_prod.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_dynamodb_table" "terraform_locks_prod" {
  name         = "terraform-up-and-running-locks_prod"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}