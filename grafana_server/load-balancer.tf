

resource "aws_security_group" "this" {
  provider    = "aws.current"
  name        = "${var.name}-alb_sg"
  description = "Application Load Balancing security group"
  vpc_id      = "${var.vpc_id}"

  # HTTP access from the VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # outbound internet access
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPs access from the VPC
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # outbound internet access
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(var.tags, map("Name", format("%s-alb_sg", var.name)))}"
}

resource "aws_alb" "this" {
  provider        = "aws.current"
  name            = "${var.name}-alb"
  subnets         = ["${var.private_subnet_ids}"]
  security_groups = ["${aws_security_group.this.id}"]
  internal        = true
  tags = "${merge(var.tags, map("Name", format("%s-alb", var.name)))}"
}

data "aws_acm_certificate" "grafana" {
  provider = "aws.current"
  domain   = "${var.domain}"
  statuses = ["ISSUED","PENDING_VALIDATION"]
}

resource "aws_alb_listener" "this" {
  provider          = "aws.current"
  load_balancer_arn = "${aws_alb.this.arn}"
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = "${data.aws_acm_certificate.grafana.arn}"
  default_action {
    target_group_arn = "${aws_alb_target_group.this.arn}"
    type             = "forward"
  }
}

resource "aws_alb_listener_rule" "this" {
  provider     = "aws.current"
  listener_arn = "${aws_alb_listener.this.arn}"
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.this.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/static/*"]
  }
}

