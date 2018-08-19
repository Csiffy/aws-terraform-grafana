
resource "aws_ecs_task_definition" "grafana" {
  provider = "aws.current"
  family = "${var.name}-grafana-task-def"
  volume {
    name      = "grafanaconfig"
    host_path = "/opt/grafanaconfig"
  }
  container_definitions = <<EOF
[
  {
    "name": "${var.name}-${var.grafana_container_name}",
    "image": "${var.grafana_image}:${var.grafana_version}",
    "cpu": ${var.grafana_cpu},
    "memory": ${var.grafana_memory},
    "essential": true,
    "portMappings": [
      {
        "containerPort": ${var.grafana_container_port},
        "hostPort": ${var.grafana_host_port},
        "protocol": "tcp"
      }
    ],
    "mountPoints": [
      {
        "sourceVolume": "grafanaconfig",
        "containerPath": "/var/grafana"
      }
    ]
  }
]
EOF
}

