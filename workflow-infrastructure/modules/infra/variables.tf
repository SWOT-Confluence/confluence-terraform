variable "app_name" {
  type        = string
  description = "Application name"
  default     = "confluence"
}

variable "app_version" {
  type        = string
  description = "The application version number"
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
variable "batch_max_cpus" {
  type    = number
  default = 10000
}

variable "ec2_key_pair" {
  type        = string
  description = "Key pair used to access EFS EC2 instances"
}

variable "environment" {
  type        = string
  description = "The environment in which to deploy to"
}

variable "lpdaac_user" {
  type        = string
  description = "Username to retrieve LPDAAC data"
}

variable "lpdaac_password" {
  type        = string
  description = "Password to retrieve LPDAAC data"
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

variable "sns_email_reports" {
  type        = string
  description = "Email address to SNS topic reports to"
}
variable "vpc_id" {
  type = string
  description = "Default VPC identifier"
}

variable "vpc_sg_id" {
  type = string
  description = "Default VPC security group"
}

variable "vpc_subnets" {
  type = list(string)
  description = "VPC subnet identifiers"
}
