FROM alpine as build
ADD https://releases.hashicorp.com/terraform/0.12.0-beta1/terraform_0.12.0-beta1_linux_amd64.zip /files/terraform.zip
ADD http://terraform-0.12.0-dev-snapshots.s3-website-us-west-2.amazonaws.com/terraform-provider-random/3.0.0-dev20190216H01-dev/terraform-provider-random_3.0.0-dev20190216H01-dev_linux_amd64.zip /files/random.zip
ADD http://terraform-0.12.0-dev-snapshots.s3-website-us-west-2.amazonaws.com/terraform-provider-null/2.1.0-dev20190216H00-dev/terraform-provider-null_2.1.0-dev20190216H00-dev_linux_amd64.zip /files/null.zip
ADD http://terraform-0.12.0-dev-snapshots.s3-website-us-west-2.amazonaws.com/terraform-provider-aws/1.60.0-dev20190216H00-dev/terraform-provider-aws_1.60.0-dev20190216H00-dev_linux_amd64.zip /files/aws.zip

WORKDIR /files
RUN mkdir /build
RUN for f in *.zip; do unzip $f -d /build; done

FROM alpine
RUN apk add --no-cache -U git openssh
COPY --from=build /build/* /usr/local/bin/
WORKDIR /tf
ENTRYPOINT [ "terraform" ]
