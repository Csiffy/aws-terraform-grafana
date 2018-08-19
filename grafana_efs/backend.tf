
terraform {
    backend "s3" {
        bucket = "test-terraform-states"
        key = "grafana-test/grafana-efs.tfstate"
        region = "eu-central-1"
    }
}

