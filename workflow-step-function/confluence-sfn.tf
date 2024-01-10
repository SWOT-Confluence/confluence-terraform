# Confluence Step Function State Machine
resource "aws_sfn_state_machine" "confluence_state_machine" {
  name       = "${var.prefix}-workflow"
  role_arn   = aws_iam_role.step_function_role.arn
  definition = templatefile("confluence-sfn-workflow.asl.json", { aws_region = var.aws_region, account_id = local.account_id, prefix = var.prefix, ssm_key_id = data.aws_kms_key.ssm_key.id })
  tracing_configuration {
    enabled = true
  }
}
