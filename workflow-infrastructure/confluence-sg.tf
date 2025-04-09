# EFS security group for NFS traffic
resource "aws_security_group" "efs_sg" {
  name        = "${var.prefix}-efs-mount-target"
  description = "Allow NFS traffic to EFS mount targets"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "efs_sg_ingress" {
  type      = "ingress"
  from_port = 2049
  to_port   = 2049
  protocol  = "tcp"
  cidr_blocks = values(data.aws_subnet.subnet_list).*.cidr_block
  security_group_id = aws_security_group.efs_sg.id
}

resource "aws_security_group_rule" "efs_sg_egress" {
  type              = "egress"
  to_port           = 0
  from_port         = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.efs_sg.id
}

resource "aws_security_group" "ssh_sg" {
  name        = "${var.prefix}-ec2-ssh"
  description = "Allow SSH traffic to EC2 instances"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "ssh_sg_ingress" {
  type      = "ingress"
  from_port = 22
  to_port   = 22
  protocol  = "tcp"
  cidr_blocks = [
    var.ssh_subnet
  ]
  security_group_id = aws_security_group.ssh_sg.id
}

resource "aws_security_group_rule" "ssh_sg_egress" {
  type              = "egress"
  to_port           = 0
  from_port         = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.ssh_sg.id
}