# Terraform Docker Image

Builds Terraform as a docker image. Images built with this
repository are listed below and are available at
https://hub.docker.com/r/lsegal/terraform

## 0.12.0-beta1

Run with:

```sh
docker run -v $(pwd):/tf lsegal/terraform:0.12.0-beta1 version
```

## Usage Notes

The `-v $(pwd):/tf` mount attaches your local workspace to
the image so it can operate on your host directory. If you
prefer to work in containers, you can create a Dockerfile
to manage state:

```dockerfile
FROM lsegal/terraform:0.12.0-beta1
COPY . /tf/

RUN terraform init
RUN terraform apply -auto-approve
```
