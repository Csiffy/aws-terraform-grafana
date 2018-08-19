
resource "aws_ecs_task_definition" "influxdb" {
  provider = "aws.current"
  family = "${var.name}-influxdb-task-def"
  volume {
    name      = "influxdb"
    host_path = "/opt/grafanaconfig"
  }
  container_definitions = <<EOF
[
  {
    "name": "${var.name}-${var.influxdb_container_name}",
    "image": "${var.influxdb_image}:${var.influxdb_version}",
    "cpu": ${var.influxdb_cpu},
    "memory": ${var.influxdb_memory},
    "essential": true,
    "portMappings": [
      {
        "containerPort": ${var.influxdb_container_port},
        "hostPort": ${var.influxdb_host_port},
        "protocol": "tcp"
      }
    ],
    "mountPoints": [
      {
        "sourceVolume": "influxdb",
        "containerPath": "/var/lib/influxdb"
      }
    ]
  }
]
EOF
}

