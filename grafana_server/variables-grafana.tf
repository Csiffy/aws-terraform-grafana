

variable "grafana_container_name" {
  type = "string"
  description = "describe your variable"
  default = "container"
}

variable "grafana_image" {
  type = "string"
  description = "describe your variable"
  default = "grafana"
}

variable "grafana_version" {
  type = "string"
  description = "describe your variable"
  default = "latest"
}

variable "grafana_container_port" {
  description = "describe your variable"
  default = 80
}

variable "grafana_host_port" {
  description = "describe your variable"
  default = 80
}

variable "grafana_cpu" {
  description = "describe your variable"
  default = 1024
}

variable "grafana_memory" {
  description = "Set the memory size in MB"
  default = 128
}

