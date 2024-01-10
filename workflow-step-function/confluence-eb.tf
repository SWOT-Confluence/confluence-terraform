# EventBridge Rule for Batch
resource "aws_cloudwatch_event_rule" "sfn_batch" {
  name        = "${var.prefix}-step-functions-get-events-for-batch-jobs-rule"
  description = "This rule is used to notify Step Functions regarding AWS Batch jobs"
  event_pattern = jsonencode({
    "source" : [
      "aws.batch"
    ],
    "detail-type" : [
      "Batch Job State Change"
    ],
    "detail" : {
      "status" : [
        "SUCCEEDED",
        "FAILED"
      ],
      "container" : {
        "environment" : {
          "name" : [
            "MANAGED_BY_AWS"
          ],
          "value" : [
            "STARTED_BY_STEP_FUNCTIONS"
          ]
        }
      }
    }
  })
}

resource "aws_cloudwatch_event_target" "sfn_batch_target" {
  arn      = aws_sfn_state_machine.confluence_state_machine.arn
  rule     = aws_cloudwatch_event_rule.sfn_batch.name
  role_arn = aws_iam_role.event_bridge_sfn_role.arn
}