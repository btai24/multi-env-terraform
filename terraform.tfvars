cidr_base = {
  "dev_us-west-1"  = "10.0"
  "prod_us-west-2" = "10.1"
}

asg_min_size = {
  "dev"  = 1
  "prod" = 2
}

asg_max_size = {
  "dev"  = 1
  "prod" = 3
}

"ami_id" = {
  "us-west-1" = "ami-0e854fa49e70b76da"
  "us-west-2" = "ami-0661bd6af3b02a8d3"
}

"instance_type" = {
  "dev"  = "t2.micro"
  "prod" = "t2.large"
}
