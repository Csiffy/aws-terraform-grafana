
resource "aws_alb_target_group" "this" {
  provider  = "aws.current"
  count     = "1"
  name      = "${var.name}-tg"
  port      = "${var.grafana_host_port}"
  protocol  = "HTTP"
  vpc_id    = "${var.vpc_id}"
  health_check {
    healthy_threshold   = 2
    interval            = 15
    path                = "/"
    timeout             = 10
    unhealthy_threshold = 2
    matcher             = "200,202"
  }
  tags = "${merge(var.tags, map("Name", format("%s-tg", var.name)))}"
  depends_on = ["aws_alb.this"]
}

