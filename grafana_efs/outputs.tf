output "aws_efs_file_system" {
  value = "${aws_efs_file_system.grafana_config.dns_name}"
}

