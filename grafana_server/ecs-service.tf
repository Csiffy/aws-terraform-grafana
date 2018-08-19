
resource "aws_ecs_service" "grafana" {
  provider = "aws.current"
  name = "${var.name}-ecs-grafana-service"
  cluster = "${aws_ecs_cluster.this.id}"
  task_definition = "${aws_ecs_task_definition.grafana.arn}"
  desired_count = "${var.desired_count}"
  iam_role = "${aws_iam_role.ecs_service_role.arn}"

  deployment_minimum_healthy_percent = "${var.deployment_minimum_healthy_percent}"
  deployment_maximum_percent = "${var.deployment_maximum_percent}"

  load_balancer {
    target_group_arn = "${aws_alb_target_group.this.arn}"
    container_name   = "${var.name}-${var.grafana_container_name}"
    container_port   = "${var.grafana_container_port}"
  }

  depends_on = ["aws_iam_role_policy.ecs_service_policy"]
}


resource "aws_ecs_service" "influxdb" {
  provider = "aws.current"
  name = "${var.name}-ecs-influxdb-service"
  cluster = "${aws_ecs_cluster.this.id}"
  task_definition = "${aws_ecs_task_definition.influxdb.arn}"
  desired_count = "${var.desired_count}"
  depends_on = ["aws_iam_role_policy.ecs_service_policy"]
}

