resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# Create an S3 bucket
resource "aws_s3_bucket" "demo_bucket" {
  bucket        = "${var.bucket_name_prefix}-${random_id.bucket_suffix.hex}"
  force_destroy = true
}

# Enable versioning for the bucket
resource "aws_s3_bucket_versioning" "demo_bucket_versioning" {
  bucket = aws_s3_bucket.demo_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Upload a file to the bucket
resource "aws_s3_object" "demo_object" {
  bucket = aws_s3_bucket.demo_bucket.id
  key    = "hello-world.txt"
  source = "${path.module}/test-file.txt"
  etag   = filemd5("${path.module}/test-file.txt")
}