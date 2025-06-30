output "batch_job_iam_role_arn" {
  value = aws_iam_role.batch_job_role.arn
}

output "efs_file_system_ids" {
  value = {
    input = aws_efs_file_system.efs_fs_in.id
    flpe = aws_efs_file_system.efs_fs_flpe.id
    moi = aws_efs_file_system.efs_fs_moi.id
    diagnostics = aws_efs_file_system.efs_fs_diag.id
    offline = aws_efs_file_system.efs_fs_off.id
    validation = aws_efs_file_system.efs_fs_val.id
    output = aws_efs_file_system.efs_fs_out.id
    logs = aws_efs_file_system.efs_fs_logs.id
  }
}

output "exec_iam_role_arn" {
  value = aws_iam_role.ecs_exe_task_role.arn
}

output "s3_bucket_sos" {
  value = aws_s3_bucket.aws_s3_bucket_sos.id
}

output "s3_bucket_json" {
  value = aws_s3_bucket.aws_s3_bucket_json.id
}

output "s3_bucket_config" {
  value = aws_s3_bucket.aws_s3_bucket_config.id
}
