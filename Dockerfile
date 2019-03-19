FROM alpine:3.9

ENV TERRAFORM_VERSION=0.11.13

RUN apk update && apk add ca-certificates unzip wget
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -P /tmp
RUN unzip /tmp/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin

RUN mkdir /opt/multi-env-terraform
WORKDIR /opt/multi-env-terraform
COPY . /opt/multi-env-terraform