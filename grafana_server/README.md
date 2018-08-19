

Fill out the following variables in the "grafana.tfvars" file

-  vpc_id
-  private_subnet_ids
-  public_subnet_ids
-  domain (need for the load balancer and for the certificate)
-  key_name (optional)
-  grafana_image: {aws_account_id}.dkr.ecr.{region}.amazonaws.com/{repo}/grafana:{version}
-  influxdb_image: {aws_account_id}.dkr.ecr.{region}.amazonaws.com/{repo}/influxdb:{version}

Please create an instance "Key Pairs" with "grafana-test" name or change the "key_name" variable too

You need to initialize the terraform codes

```terraform init```

Create an execution plan

```terraform plan -var-file=grafana.tfvars```

If everything ran fine please run the following command to create all resources

```terraform apply -var-file=grafana.tfvars```


