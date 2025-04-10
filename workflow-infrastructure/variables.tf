variable "app_name" {
  type        = string
  description = "Application name"
  default     = "confluence"
}

variable "app_version" {
  type        = number
  description = "The application version number"
  default     = 0.1
}

variable "aws_region" {
  type        = string
  description = "AWS region to deploy to"
  default     = "us-west-2"
}

variable "default_tags" {
  type    = map(string)
  default = {}
}

variable "ec2_key_pair" {
  type        = string
  description = "Key pair used to access EFS EC2 instances"
}

variable "sns_email_reports" {
  type        = string
  description = "Email address to SNS topic reports to"
}

variable "environment" {
  type        = string
  description = "The environment in which to deploy to"
}

variable "permissions_boundary" {
  type = string
  description = "Determine if permission boundary needs to be set"
  default = null
}

variable "prefix" {
  type        = string
  description = "Prefix to add to all AWS resources as a unique identifier"
}

variable "vpc_id" {
  type = string
  description = "Default VPC identifier"
  # sensitive = true
}

variable "vpc_sg_id" {
  type = string
  description = "Default VPC security group"
  # sensitive = true
}

variable "vpc_subnets" {
  type = list(string)
  description = "VPC subnet identifiers"
  # sensitive = true
}
