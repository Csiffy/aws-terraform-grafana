name = "grafana-infra-monitoring"
aws_region = "eu-central-1"
size = "1"
instance_type = "t2.medium"
allow_inbound_ports_and_cidr_blocks = {"22"="0.0.0.0/0","80"="0.0.0.0/0","443"="0.0.0.0/0"}
key_name = "grafana-test"
agent_version = "latest"
num_env_vars = "0"
deployment_maximum_percent = "200"
deployment_minimum_healthy_percent = "100"
tags = {
  Environment = "TEST"
  CreatedBy   = "Csiffy"
  ManagedBy   = "Terraform"
  Role        = "Monitoring"
}

desired_count = "1"
grafana_image = "grafana"
grafana_version = "4.5.2"
grafana_cpu = "1024"
grafana_memory = "256" # in MB
grafana_container_port = "3000"
grafana_host_port = "3000"
influxdb_image = "influxdb"
influxdb_version = "latest"
influxdb_cpu = "1024"
influxdb_memory = "512" # in MB
influxdb_container_port = "8086"
influxdb_host_port = "8086"
