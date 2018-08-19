

resource "aws_ecs_cluster" "this" {
  provider = "aws.current"
  name     = "${var.name}-ecs-cluster"
}


