
resource "aws_security_group" "ecs_instance" {
  provider = "aws.current"
  name = "${var.name}-ecs-sg"
  description = "Security group for the EC2 instances in the ECS cluster ${var.name}-ecs-sg"
  vpc_id = "${var.vpc_id}"

  lifecycle {
    create_before_destroy = true
  }
  tags = "${merge(var.tags, map("Name", format("%s-ecs-sg", var.name)))}"
}

resource "aws_security_group_rule" "all_outbound_all" {
  provider = "aws.current"
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.ecs_instance.id}"
}

resource "aws_security_group_rule" "all_inbound_ports" {
  provider = "aws.current"
  count = "${length(var.allow_inbound_ports_and_cidr_blocks)}"
  type = "ingress"
  from_port = "${element(keys(var.allow_inbound_ports_and_cidr_blocks), count.index)}"
  to_port = "${element(keys(var.allow_inbound_ports_and_cidr_blocks), count.index)}"
  protocol = "tcp"
  cidr_blocks = ["${lookup(var.allow_inbound_ports_and_cidr_blocks, element(keys(var.allow_inbound_ports_and_cidr_blocks), count.index))}"]
  security_group_id = "${aws_security_group.ecs_instance.id}"
}

