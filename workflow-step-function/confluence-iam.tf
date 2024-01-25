# Step Function Role
resource "aws_iam_role" "step_function_role" {
  name = "${var.prefix}-step-function-role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "states.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

# # Cloudwatch
resource "aws_iam_role_policy_attachment" "sfn_role_policy_attach_1" {
  role       = aws_iam_role.step_function_role.name
  policy_arn = aws_iam_policy.sfn_cloudwatch.arn
}

resource "aws_iam_policy" "sfn_cloudwatch" {
  name        = "${var.prefix}-sfn-cloudwatch-policy"
  description = "Step Function policy for CloudWatch Log delivery"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogDelivery",
          "logs:GetLogDelivery",
          "logs:UpdateLogDelivery",
          "logs:DeleteLogDelivery",
          "logs:ListLogDeliveries",
          "logs:PutResourcePolicy",
          "logs:DescribeResourcePolicies",
          "logs:DescribeLogGroups"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups"
        ],
        "Resource" : aws_cloudwatch_log_group.generate_cw_log_group_sfn.arn
      }
    ]
  })
}

# # Xray
resource "aws_iam_role_policy_attachment" "sfn_role_policy_attach_2" {
  role       = aws_iam_role.step_function_role.name
  policy_arn = aws_iam_policy.sfn_xray.arn
}

resource "aws_iam_policy" "sfn_xray" {
  name        = "${var.prefix}-sfn-xray-policy"
  description = "Step Function policy for X-Ray"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "xray:PutTraceSegments",
          "xray:PutTelemetryRecords",
          "xray:GetSamplingRules",
          "xray:GetSamplingTargets"
        ],
        "Resource" : "*"
      }
    ]
  })
}

# # EventBridge
resource "aws_iam_role_policy_attachment" "sfn_role_policy_attach_3" {
  role       = aws_iam_role.step_function_role.name
  policy_arn = aws_iam_policy.sfn_event_bridge.arn
}

resource "aws_iam_policy" "sfn_event_bridge" {
  name        = "${var.prefix}-sfn-event-bridge-policy"
  description = "Step Function policy for EventBridge rules"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "events:PutTargets",
          "events:PutRule",
          "events:DescribeRule"
        ],
        "Resource" : "*"
      }
    ]
  })
}

# # Batch
resource "aws_iam_role_policy_attachment" "sfn_role_policy_attach_4" {
  role       = aws_iam_role.step_function_role.name
  policy_arn = aws_iam_policy.sfn_batch.arn
}

resource "aws_iam_policy" "sfn_batch" {
  name        = "${var.prefix}-sfn-batch-policy"
  description = "Step Function policy for Batch jobs"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "batch:SubmitJob",
          "batch:DescribeJobs",
          "batch:TerminateJob"
        ],
        "Resource" : "*"
      }
    ]
  })
}

# # Lambda
resource "aws_iam_role_policy_attachment" "sfn_role_policy_attach_5" {
  role       = aws_iam_role.step_function_role.name
  policy_arn = aws_iam_policy.sfn_lambda.arn
}

resource "aws_iam_policy" "sfn_lambda" {
  name        = "${var.prefix}-sfn-lambda-policy"
  description = "Step Function policy for Lambda Functions"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "lambda:InvokeFunction"
        ],
        "Resource" : "arn:aws:lambda:${var.aws_region}:${local.account_id}:function:${var.prefix}-enable-renew"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "lambda:InvokeFunction"
        ],
        "Resource" : "arn:aws:lambda:${var.aws_region}:${local.account_id}:function:${var.prefix}-generate-array-size"
      }
    ]
  })
}

# # S3
resource "aws_iam_role_policy_attachment" "sfn_role_policy_attach_6" {
  role       = aws_iam_role.step_function_role.name
  policy_arn = aws_iam_policy.sfn_s3.arn
}

resource "aws_iam_policy" "sfn_s3" {
  name        = "${var.prefix}-sfn-s3-policy"
  description = "Step Function policy for access to S3 Bucket"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowListAllBuckets",
        "Effect" : "Allow",
        "Action" : "s3:ListAllMyBuckets",
        "Resource" : "*"
      },
      {
        "Sid" : "AllowListBuckets",
        "Effect" : "Allow",
        "Action" : [
          "s3:ListBucket",
          "s3:ListBucketVersions"
        ],
        "Resource" : [
          "{${data.aws_s3_bucket.s3_json.arn}}"
        ]
      },
      {
        "Sid" : "AllGetObjects",
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:GetObjectAttributes",
        ],
        "Resource" : [
          "{${data.aws_s3_bucket.s3_json.arn}}/*"
        ]
      }
    ]
  })
}

# EventBridge Role
resource "aws_iam_role" "event_bridge_sfn_role" {
  name = "${var.prefix}-event-bridge-sfn-role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "events.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "event_bridge_sfn_role_policy_attach_1" {
  role       = aws_iam_role.event_bridge_sfn_role.name
  policy_arn = aws_iam_policy.event_bridge_sfn_policy.arn
}

resource "aws_iam_policy" "event_bridge_sfn_policy" {
  name        = "${var.prefix}-event-bridge-sfn-policy"
  description = "Allow EventBridge to execute Step Function state machine"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "states:StartExecution"
        ],
        "Resource" : [
          "${aws_sfn_state_machine.confluence_state_machine.arn}"
        ]
      }
    ]
  })
}