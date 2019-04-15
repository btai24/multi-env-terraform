domain_name = "westladevops.cloud"

cidr_base = {
  "dev_us-west-2"  = "10.0"
  "dev_us-east-1"  = "10.1"
  "qa_us-east-1"   = "10.2"
  "prod_us-west-1" = "10.3"
  "prod_us-west-2" = "10.4"
}

asg_min_size = {
  "dev"  = 1
  "qa"   = 1
  "prod" = 2
}

asg_max_size = {
  "dev"  = 1
  "qa"   = 1
  "prod" = 3
}

"ami_id" = {
  "us-west-1" = "ami-0f1d0daf2937d0064"
  "us-west-2" = "ami-0b4a4b368aa8bd6f0"
  "us-east-1" = "ami-06d990a360d7a793c"
  "us-east-2" = "ami-005bbe08bd2878a92"
}

"instance_type" = {
  "dev"  = "t2.micro"
  "qa"   = "t2.medium"
  "prod" = "t2.large"
}

"ssl_certificate_arn" = {
  "us-west-1" = "arn:aws:acm:us-west-1:393732463345:certificate/25eb2827-7757-4126-85ec-04b1cc7417d5"
  "us-west-2" = "arn:aws:acm:us-west-2:393732463345:certificate/51dc14d3-418f-4915-9ece-34afbb7c18f5"
  "us-east-1" = "arn:aws:acm:us-east-1:393732463345:certificate/3610f046-bf5f-4754-9173-556960f381a9"
  "us-east-2" = "arn:aws:acm:us-east-2:393732463345:certificate/883ab1a6-67a3-4523-b488-920aaa3a9a79"
}
