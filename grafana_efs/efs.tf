
resource "aws_efs_file_system" "grafana_config" {
  provider = "aws.current"
  tags = "${merge(var.tags, map("Name", format("%s-monitoring", var.name)))}"
}

resource "aws_efs_mount_target" "grafana_config_mountp" {
  provider = "aws.current"
  count = "${var.subnet_count}"
  file_system_id = "${aws_efs_file_system.grafana_config.id}"
  subnet_id = "${element(var.private_subnet_ids, count.index)}"
  security_groups = ["${aws_security_group.nfs_sg.id}"]
}

resource "aws_security_group" "nfs_sg" {
  provider = "aws.current"
  name = "${var.name}-nfs-sg"
  description = "Security group for the EC2 instances in the ECS cluster ${var.name}-nfs-sg"
  vpc_id = "${var.vpc_id}"

  lifecycle {
    create_before_destroy = true
  }
  tags = "${merge(var.tags, map("Name", format("%s-nfs-sg", var.name)))}"
}

# TODO -> Need to change the Source section to the instance security group...
resource "aws_security_group_rule" "nfs_inbound_port" {
  provider = "aws.current"
  type = "ingress"
  from_port = 2049
  to_port = 2049
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.nfs_sg.id}"
}

#count        = "${var.az_count}"
#subnet_id = "${element("${aws_subnet.main.*.id}", count.index)}"
#subnet_id = "${element(split(",", var.mgmt_subnet_ids), count.index)}"
#subnet_id = "${element(var.mgmt_subnet_ids, count.index)}"


