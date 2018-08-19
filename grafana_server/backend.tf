
terraform {
    backend "s3" {
        bucket = "test-terraform-states"
        key = "grafana-test/grafana-test_terraform.tfstate"
        region = "eu-central-1"
    }
}

data "terraform_remote_state" "efs_dns_name" {
  backend = "s3"
  config {
	bucket = "test-terraform-states"
	key = "grafana-test/grafana-efs.tfstate"
	region = "eu-central-1"
  }
}
