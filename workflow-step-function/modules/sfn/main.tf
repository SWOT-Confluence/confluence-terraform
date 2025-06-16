# Data sources
data "aws_caller_identity" "current" {}

data "aws_s3_bucket" "s3_json" {
  bucket = var.s3_json_bucket
}

# Local variables
locals {
  account_id = data.aws_caller_identity.current.account_id
  default_tags = length(var.default_tags) == 0 ? {
    application : var.app_name,
    environment : lower(var.environment),
    version : var.app_version
  } : var.default_tags
}