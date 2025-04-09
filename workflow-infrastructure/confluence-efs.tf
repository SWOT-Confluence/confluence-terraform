# logs
resource "aws_efs_file_system" "efs_fs_logs" {
  creation_token   = "${var.prefix}-logs"
  encrypted        = true
  performance_mode = "generalPurpose"
  throughput_mode  = "elastic"
  tags             = { Name = "${var.prefix}-logs" }
}

resource "aws_efs_mount_target" "efs_mnt_logs" {
  for_each = "${toset(var.vpc_subnets)}"
  file_system_id = aws_efs_file_system.efs_fs_logs.id
  subnet_id = each.value
  security_groups = [
    var.vpc_sg_id,
    aws_security_group.efs_sg.id
  ]
}

# validation
resource "aws_efs_file_system" "efs_fs_val" {
  creation_token   = "${var.prefix}-validation"
  encrypted        = true
  performance_mode = "generalPurpose"
  throughput_mode  = "elastic"
  tags             = { Name = "${var.prefix}-validation" }
}

resource "aws_efs_mount_target" "efs_mnt_val" {
  for_each = "${toset(var.vpc_subnets)}"
  file_system_id = aws_efs_file_system.efs_fs_val.id
  subnet_id = each.value
  security_groups = [
    var.vpc_sg_id,
    aws_security_group.efs_sg.id
  ]
}

# offline
resource "aws_efs_file_system" "efs_fs_off" {
  creation_token   = "${var.prefix}-offline"
  encrypted        = true
  performance_mode = "generalPurpose"
  throughput_mode  = "elastic"
  tags             = { Name = "${var.prefix}-offline" }
}

resource "aws_efs_mount_target" "efs_mnt_off" {
  for_each = "${toset(var.vpc_subnets)}"
  file_system_id = aws_efs_file_system.efs_fs_off.id
  subnet_id = each.value
  security_groups = [
    var.vpc_sg_id,
    aws_security_group.efs_sg.id
  ]
}

# output
resource "aws_efs_file_system" "efs_fs_out" {
  creation_token   = "${var.prefix}-output"
  encrypted        = true
  performance_mode = "generalPurpose"
  throughput_mode  = "elastic"
  tags             = { Name = "${var.prefix}-output" }
}

resource "aws_efs_mount_target" "efs_mnt_out" {
  for_each = "${toset(var.vpc_subnets)}"
  file_system_id = aws_efs_file_system.efs_fs_out.id
  subnet_id = each.value
  security_groups = [
    var.vpc_sg_id,
    aws_security_group.efs_sg.id
  ]
}

# diagnostics
resource "aws_efs_file_system" "efs_fs_diag" {
  creation_token   = "${var.prefix}-diagnostics"
  encrypted        = true
  performance_mode = "generalPurpose"
  throughput_mode  = "elastic"
  tags             = { Name = "${var.prefix}-diagnostics" }
}

resource "aws_efs_mount_target" "efs_mnt_diag" {
  for_each = "${toset(var.vpc_subnets)}"
  file_system_id = aws_efs_file_system.efs_fs_diag.id
  subnet_id = each.value
  security_groups = [
    var.vpc_sg_id,
    aws_security_group.efs_sg.id
  ]
}

# moi
resource "aws_efs_file_system" "efs_fs_moi" {
  creation_token   = "${var.prefix}-moi"
  encrypted        = true
  performance_mode = "generalPurpose"
  throughput_mode  = "elastic"
  tags             = { Name = "${var.prefix}-moi" }
}

resource "aws_efs_mount_target" "efs_mnt_moi" {
  for_each = "${toset(var.vpc_subnets)}"
  file_system_id = aws_efs_file_system.efs_fs_moi.id
  subnet_id = each.value
  security_groups = [
    var.vpc_sg_id,
    aws_security_group.efs_sg.id
  ]
}

# input
resource "aws_efs_file_system" "efs_fs_in" {
  creation_token   = "${var.prefix}-input"
  encrypted        = true
  performance_mode = "generalPurpose"
  throughput_mode  = "elastic"
  tags             = { Name = "${var.prefix}-input" }
}

resource "aws_efs_mount_target" "efs_mnt_in" {
  for_each = "${toset(var.vpc_subnets)}"
  file_system_id = aws_efs_file_system.efs_fs_in.id
  subnet_id = each.value
  security_groups = [
    var.vpc_sg_id,
    aws_security_group.efs_sg.id
  ]
}

# flpe
resource "aws_efs_file_system" "efs_fs_flpe" {
  creation_token   = "${var.prefix}-flpe"
  encrypted        = true
  performance_mode = "generalPurpose"
  throughput_mode  = "elastic"
  tags             = { Name = "${var.prefix}-flpe" }
}

resource "aws_efs_mount_target" "efs_mnt_flpe" {
  for_each = "${toset(var.vpc_subnets)}"
  file_system_id = aws_efs_file_system.efs_fs_flpe.id
  subnet_id = each.value
  security_groups = [
    var.vpc_sg_id,
    aws_security_group.efs_sg.id
  ]
}
