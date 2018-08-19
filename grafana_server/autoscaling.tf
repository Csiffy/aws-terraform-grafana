
resource "aws_autoscaling_group" "ecs_cluster_instances" {
  provider = "aws.current"
  name     = "${var.name}-asg"
  min_size = "${var.size}"
  max_size = "${var.size}"
  launch_configuration = "${aws_launch_configuration.ecs_instance.name}"
  vpc_zone_identifier  = ["${var.private_subnet_ids}"]
  #desired_capacity    = "${var.autoscale_desired}"
  #health_check_type   = "EC2"

  tag {
    key   = "Name"
    value = "${var.name}-instance"
    propagate_at_launch = true
  }
}

# Fetch the AWS ECS Optimized Linux AMI.
data "aws_ami" "ecs" {
  provider = "aws.current"
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }
}

# The launch configuration for each EC2 Instance that will run in the ECS
# Cluster
resource "aws_launch_configuration" "ecs_instance" {
  provider      = "aws.current"
  #name          = "${var.name}-launch_configuration" #The name of the launch configuration. If you leave this blank, Terraform will auto-generate a unique name
  name_prefix   = "${var.name}-"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"
  image_id      = "${data.aws_ami.ecs.id}"
  iam_instance_profile = "${aws_iam_instance_profile.ecs_instance.name}"
  security_groups      = ["${aws_security_group.ecs_instance.id}"]
  associate_public_ip_address = false

  # A shell script that will execute when on each EC2 instance when it first boots
  user_data    = <<EOF
#!/bin/bash
echo "ECS_CLUSTER=${aws_ecs_cluster.this.name}" > /etc/ecs/ecs.config
echo "ECS_LOGLEVEL=${var.log_level}" >> /etc/ecs/ecs.config
echo "ECS_VERSION=${var.agent_version}" >> /etc/ecs/ecs.config
echo '10.0.0.10 example.com' | sudo tee --append /etc/hosts
sudo yum update -y
sudo yum install -y nfs-utils
sudo mkdir -p /opt/grafanaconfig
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 ${data.terraform_remote_state.efs_dns_name.aws_efs_file_system}:/ /opt/grafanaconfig
EOF

  lifecycle {
    create_before_destroy = true
  }
}


