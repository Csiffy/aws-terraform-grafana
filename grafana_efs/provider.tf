


# Configure the AWS Provider
provider "aws" {
  alias    = "current"
  version = "> 0.1"
  region     = "${var.aws_region}"
}

