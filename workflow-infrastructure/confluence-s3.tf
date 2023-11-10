# SOS S3 Bucket
resource "aws_s3_bucket" "aws_s3_bucket_sos" {
  bucket        = "${var.prefix}-sos"
  force_destroy = true
  tags          = { Name = "${var.prefix}-sos" }
}

resource "aws_s3_bucket_public_access_block" "aws_s3_bucket_sos_public_block" {
  bucket                  = aws_s3_bucket.aws_s3_bucket_sos.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "aws_s3_bucket_sos_ownership" {
  bucket = aws_s3_bucket.aws_s3_bucket_sos.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "aws_s3_bucket_sos_encryption" {
  bucket = aws_s3_bucket.aws_s3_bucket_sos.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = "aws/s3"
    }
  }
}
