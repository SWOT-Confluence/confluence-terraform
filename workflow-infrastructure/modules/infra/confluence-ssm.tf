# SSC credentials for LPDAAC access
resource "aws_ssm_parameter" "lpdaac_user" {
  name        = "${var.prefix}-lpdaac-user"
  description = "Username to retrieve LPDAAC data"
  type        = "SecureString"
  value       = var.lpdaac_user
  overwrite   = true
}

resource "aws_ssm_parameter" "lpdaac_password" {
  name        = "${var.prefix}-lpdaac-password"
  description = "Password to retrieve LPDAAC data"
  type        = "SecureString"
  value       = var.lpdaac_password
  overwrite   = true
}