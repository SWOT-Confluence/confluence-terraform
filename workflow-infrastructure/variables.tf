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

variable "environment" {
  type        = string
  description = "The environment in which to deploy to"
}

variable "mgmt_account" {
  type        = string
  description = "Name of account allowed to manage KMS key"
}

variable "prefix" {
  type        = string
  description = "Prefix to add to all AWS resources as a unique identifier"
}

variable "profile" {
  type        = string
  description = "Named profile used for AWS authentication credentials"
}

variable "subnet_a_public_cidr" {
  type        = string
  description = "CIDR range for public subnet in us-west-2a"
}

variable "subnet_a_private_cidr" {
  type        = string
  description = "CIDR range for private subnet in us-west-2a"
}

variable "subnet_b_cidr" {
  type        = string
  description = "CIDR range for private subnet in us-west-2a"
}

variable "subnet_c_cidr" {
  type        = string
  description = "CIDR range for private subnet in us-west-2a"
}

variable "subnet_d_cidr" {
  type        = string
  description = "CIDR range for private subnet in us-west-2a"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR range for VPC"
}