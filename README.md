# Multi-Environment (and Region) Terraform using Terraform Workspaces

### Add AWS credentials at ~/.aws/credentials
```
[default]
region=us-west-2
aws_access_key_id=ACESSKEYID
aws_secret_access_key=secret
```

### Build the Docker Image
```
docker build -t multi-env-terraform:latest .
```

### Run the Docker Image
```
docker run -it --rm -v ~/.aws:/root/.aws multi-env-terraform:latest
```

### Terraform Init
```
/opt/multi-env-terraform $ terraform init
```

### Terraform Workspace
```
/opt/multi-env-terraform $ terraform workspace new {environment}_{region}

/opt/multi-env-terraform $ terraform workspace select {environment}_{region}
```

### Terraform Apply
```
/opt/multi-env-terraform $ terraform apply
```