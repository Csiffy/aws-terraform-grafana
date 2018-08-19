
resource "aws_iam_role" "ecs_service_role" {
  provider = "aws.current"
  name = "${var.name}-service-role"
  assume_role_policy = "${data.aws_iam_policy_document.ecs_service_role.json}"
}

data "aws_iam_policy_document" "ecs_service_role" {
  provider = "aws.current"
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "ecs_service_policy" {
  provider = "aws.current"
  name = "${var.name}-ecs-service-policy"
  role = "${aws_iam_role.ecs_service_role.id}"
  policy = "${data.aws_iam_policy_document.ecs_service_policy.json}"
}

data "aws_iam_policy_document" "ecs_service_policy" {
  provider = "aws.current"
  statement {
    effect = "Allow"
    resources = ["*"]
    actions = [
      "elasticloadbalancing:Describe*",
      "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
      "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
      "elasticloadbalancing:RegisterTargets",
      "elasticloadbalancing:DeregisterTargets",
      "ec2:Describe*",
      "ec2:AuthorizeSecurityGroupIngress"
    ]
  }
}


