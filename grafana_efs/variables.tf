

variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
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

variable "tags" {
  description = ""
  type = "map"
  default = {}
}

variable "aws_region" {
  description = ""
  default = "eu-central-1"
}
