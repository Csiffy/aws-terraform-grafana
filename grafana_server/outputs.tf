output "cluster_name" {
  value = "${aws_ecs_cluster.this.name}"
}

output "cluster_id" {
  value = "${aws_ecs_cluster.this.id}"
}

output "autoscaling_group_id" {
  value = "${aws_autoscaling_group.ecs_cluster_instances.id}"
}

output "autoscaling_group_arn" {
  value = "${aws_autoscaling_group.ecs_cluster_instances.arn}"
}

output "autoscaling_group_name" {
  value = "${aws_autoscaling_group.ecs_cluster_instances.name}"
}
