#!/bin/bash
#
# Script to deploy Terraform AWS infrastructure
#
# REQUIRES:
#   AWS CLI (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
#   Terraform (https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
#
# Command line arguments:
# [1] s3_state_bucket: Name of the S3 bucket to store Terraform state in (no need for s3:// prefix)
# [2] profile: Name of profile used to authenticate AWS CLI commands
# 
# Example usage: ./deploy.sh "s3-state-bucket-name" "confluence-named-profile" 

S3_STATE=$1
PROFILE=$2

terraform init -reconfigure -backend-config="bucket=$S3_STATE" -backend-config="key=confluence-sfn.tfstate" -backend-config="region=us-west-2" -backend-config="profile=$PROFILE"
terraform apply -var-file="conf.tfvars" -auto-approve