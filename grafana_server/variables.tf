

variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}

variable "aws_region" {}

variable "size" {
  description = "The number of EC2 Instances to run in the ECS Cluster."
}

variable "instance_type" {
  description = "The type of EC2 Instance to deploy in the ECS Cluster (e.g. t2.micro)."
  default     = "t2.micro"
}

variable "vpc_id" {
  description = "The ID of the VPC in which to deploy the ECS Cluster."
}

variable "private_subnet_ids" {
  description = "The subnet IDs in which to deploy the EC2 Instances of the ECS Cluster."
  type = "list"
}

variable "public_subnet_ids" {
  description = "The subnet IDs in which to deploy the EC2 Instances of the ECS Cluster."
  type = "list"
}

variable "subnet_count" {
  description = "Set the properly number regarding to the *_subnet_ids variable"
  default = "2"
}

variable "log_level" {
  description = "The log level of the cluster instance."
  default = "info"
}

variable "agent_version" {
  description = "Required agent version in the ECS instances."
  default = "latest"
}

variable "allow_inbound_ports_and_cidr_blocks" {
  description = "A map of port to CIDR block. For each entry in this map, the ESC Cluster will allow incoming requests on the specified port from the specified CIDR blocks."
  type = "map"
  default = {}
}

variable "key_name" {
  description = "The name of an EC2 Key Pair to associate with each EC2 Instance in the ECS Cluster. Leave blank to not associate a Key Pair."
  default = "default"
}

variable "allow_ssh_from_cidr_blocks" {
  description = "The list of CIDR-formatted IP address ranges from which the EC2 Instances in the ECS Cluster should accept SSH connections."
  type = "list"
  default = []
}

variable "deployment_minimum_healthy_percent" {
  description = "describe your variable"
  default = 100
}

variable "deployment_maximum_percent" {
  description = "describe your variable"
  default = 200
}

variable "desired_count" {
  description = "describe your variable"
  default     = 1
}

variable "num_env_vars" {
  description = "describe your variable"
  default = 0
}

variable "tags" {
  description = ""
  type = "map"
  default = {}
}


