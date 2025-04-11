# Data sources
data "aws_caller_identity" "current" {}

data "aws_subnet" "subnet_list" {
  for_each = "${toset(var.vpc_subnets)}"
  id = "${each.value}"
}

data "aws_key_pair" "ec2_key_pair" {
  key_name = var.ec2_key_pair
}

data "aws_kms_key" "aws_s3" {
  key_id = "alias/aws/s3"
}

# Local variables
locals {
  account_id = sensitive(data.aws_caller_identity.current.account_id)
  default_tags = length(var.default_tags) == 0 ? {
    application : var.app_name,
    environment : lower(var.environment),
    version : var.app_version
  } : var.default_tags
}