

In the "grafana.tfvars" file fill out the following variables

-  vpc_id
-  private_subnet_ids
-  public_subnet_ids

You need to initialize the terraform codes

```terraform init```

Create an execution plan

```terraform plan -var-file=grafana.tfvars```

If everything ran fine please run the following command to create all resources

```terraform apply -var-file=grafana.tfvars```



