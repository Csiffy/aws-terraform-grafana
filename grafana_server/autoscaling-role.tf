
resource "aws_iam_role" "ecs_instance" {
  provider = "aws.current"
  name = "${var.name}-ecs-instance-role"
  assume_role_policy = "${data.aws_iam_policy_document.ecs_instance.json}"

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_iam_policy_document" "ecs_instance" {
  provider = "aws.current"
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# To attach an IAM Role to an EC2 Instance, you use an IAM Instance Profile
resource "aws_iam_instance_profile" "ecs_instance" {
  provider = "aws.current"
  name = "${var.name}-ecs-instance_profile"
  role = "${aws_iam_role.ecs_instance.name}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy" "ecs_cluster_permissions" {
  provider = "aws.current"
  name = "${var.name}-ecs-cluster-permissions"
  role = "${aws_iam_role.ecs_instance.id}"
  policy = "${data.aws_iam_policy_document.ecs_cluster_permissions.json}"
}

data "aws_iam_policy_document" "ecs_cluster_permissions" {
  provider = "aws.current"
  statement {
    effect = "Allow"
    resources = ["*"]
    actions = [
      "ecs:CreateCluster",
      "ecs:DeregisterContainerInstance",
      "ecs:DiscoverPollEndpoint",
      "ecs:Poll",
      "ecs:RegisterContainerInstance",
      "ecs:StartTelemetrySession",
      "ecs:Submit*"
    ]
  }
}


