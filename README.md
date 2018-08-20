

# Grafana server installation steps

To build a Grafana server in AWS you need to do some extra steps before the server installation


## Table of contents

- [Create one User and one S3 bucket](#bucket)
- [Build a container](#container)
- [Create an EFS file system store](#efs)
- [Install the Grafana server](#grafana)


## Create one User and a S3 bucket

For a programmatic access needed one user with the following permissions
-  IAMFullAccess
-  AmazonElasticFileSystemFullAccess
-  AWSCertificateManagerFullAccess
-  AutoScalingFullAccess
-  AmazonVPCFullAccess
-  AmazonEC2ContainerServiceFullAccess
-  AmazonEC2ContainerRegistryFullAccess
-  AmazonS3FullAccess

Set the required environment variables
```bash
export AWS_SECRET_ACCESS_KEY="xxxxxxx"
export AWS_ACCESS_KEY_ID="xxxxxxx"
```

Please create a bucket, where all the ".tfstate" files will be stored
Bucket name: "test-terraform-states"

## Build a container

You have to build a Grafana docker image, and push it to a reachable registry.
For more informations you can find an example in the [grafana_docker](grafana_docker/README.md) folder.

## Create an EFS file system store

Please navigate to the [grafana_efs](grafana_efs/README.md) folder and follow the instructions


## Install the Grafana server

Last step is the Grafana server install, please navigate to the [grafana_server](grafana_server/README.md) folder



