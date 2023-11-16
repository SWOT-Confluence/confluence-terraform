# datagen
resource "aws_cloudwatch_log_group" "generate_cw_log_group_datagen" {
  name              = "/aws/batch/job/${var.prefix}-datagen/"
  retention_in_days = 0
}

# combine_data
resource "aws_cloudwatch_log_group" "generate_cw_log_group_combine_data" {
  name              = "/aws/batch/job/${var.prefix}-combine-data/"
  retention_in_days = 0
}

# input
resource "aws_cloudwatch_log_group" "generate_cw_log_group_input" {
  name              = "/aws/batch/job/${var.prefix}-input/"
  retention_in_days = 0
}

# disable_renew
resource "aws_cloudwatch_log_group" "generate_cw_log_group_disable_renew" {
  name              = "/aws/batch/job/${var.prefix}-disable-renew/"
  retention_in_days = 0
}

# prediagnostics
resource "aws_cloudwatch_log_group" "generate_cw_log_group_prediagnostics" {
  name              = "/aws/batch/job/${var.prefix}-prediagnostics/"
  retention_in_days = 0
}

# priors
resource "aws_cloudwatch_log_group" "generate_cw_log_group_priors" {
  name              = "/aws/batch/job/${var.prefix}-priors/"
  retention_in_days = 0
}

# flpe
resource "aws_cloudwatch_log_group" "generate_cw_log_group_flpe" {
  name              = "/aws/batch/job/${var.prefix}-flpe/"
  retention_in_days = 0
}

# postdiagnostics
resource "aws_cloudwatch_log_group" "generate_cw_log_group_postdiagnostics" {
  name              = "/aws/batch/job/${var.prefix}-postdiagnostics/"
  retention_in_days = 0
}

# moi
resource "aws_cloudwatch_log_group" "generate_cw_log_group_moi" {
  name              = "/aws/batch/job/${var.prefix}-moi/"
  retention_in_days = 0
}

# offline
resource "aws_cloudwatch_log_group" "generate_cw_log_group_offline" {
  name              = "/aws/batch/job/${var.prefix}-offline/"
  retention_in_days = 0
}

# validation
resource "aws_cloudwatch_log_group" "generate_cw_log_group_validation" {
  name              = "/aws/batch/job/${var.prefix}-validation/"
  retention_in_days = 0
}

# output
resource "aws_cloudwatch_log_group" "generate_cw_log_group_output" {
  name              = "/aws/batch/job/${var.prefix}-output/"
  retention_in_days = 0
}
