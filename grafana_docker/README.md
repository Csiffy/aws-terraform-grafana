

Build the image from the Dockerfile

```docker build -t grafana:{version} .```

If you do not have image modifications than just pull the official Grafana image

docker pull grafana:{version}

Set the right tag to push to the repository

```docker tag {repo}/grafana:{version} {aws_account_id}.dkr.ecr.{region}.amazonaws.com/{repo}/grafana:{version}```

Push the newly created image to the AWS repository

```docker push {aws_account_id}.dkr.ecr.{region}.amazonaws.com/{repo}/grafana:{version}```

Please repeate these steps with the influxdb image too


