output "exec_iam_role_arn" {
  value = aws_iam_role.ecs_exe_task_role.arn
}

output "batch_job_iam_role_arn" {
  value = aws_iam_role.batch_job_role.arn
}

output "efs_file_system_ids" {
  value = {
    input = aws_efs_file_system.efs_fs_in.file_system_id
    flpe = aws_efs_file_system.efs_fs_flpe.file_system_id
    moi = aws_efs_file_system.efs_fs_moi.file_system_id
    diagnostics = aws_efs_file_system.efs_fs_diag.file_system_id
    offline = aws_efs_file_system.efs_fs_off.file_system_id
    validation = aws_efs_file_system.efs_fs_val.file_system_id
    output = aws_efs_file_system.efs_fs_out.file_system_id
    logs = aws_efs_file_system.efs_fs_logs.file_system_id
  }
}
