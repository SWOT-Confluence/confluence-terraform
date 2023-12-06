
resource "aws_ssm_parameter" "aws_ssm_parameter_edl_username" {
  name   = "edl_username"
  type   = "SecureString"
  key_id = aws_kms_key.kms_key_ssm.id
  value  = var.edl_username
}

resource "aws_ssm_parameter" "aws_ssm_parameter_edl_password" {
  name   = "edl_password"
  type   = "SecureString"
  key_id = aws_kms_key.kms_key_ssm.id
  value  = var.edl_password
}

resource "aws_ssm_parameter" "aws_ssm_parameter_edl_token" {
  name   = "	bearer--edl--token"
  type   = "SecureString"
  key_id = aws_kms_key.kms_key_ssm.id
  value  = var.edl_token
}
