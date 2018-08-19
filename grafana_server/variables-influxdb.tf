
variable "influxdb_container_name" {
  type = "string"
  description = "describe your variable"
  default = "influx-container"
}

variable "influxdb_image" {
  type = "string"
  description = "describe your variable"
  default = "influxdb"
}

variable "influxdb_version" {
  type = "string"
  description = "describe your variable"
  default = "0.2"
}

variable "influxdb_host_port" {
  description = "describe your variable"
  default = 8086
}

variable "influxdb_container_port" {
  description = "describe your variable"
  default = 8086
}

variable "influxdb_cpu" {
  description = "describe your variable"
  default = 1024
}

variable "influxdb_memory" {
  description = "Set the memory size in MB"
  default = 128
}

