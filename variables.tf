variable "cidr_base" {
  type = "map"

  default = {
    "dev_us-west-1"  = "10.0"
    "dev_us-west-2"  = "10.1"
    "prod_us-west-1" = "10.2"
  }
}

variable "asg_min_size" {
  type = "map"

  default = {
    "dev"  = 1
    "prod" = 2
  }
}

variable "asg_max_size" {
  type = "map"

  default = {
    "dev"  = 1
    "prod" = 3
  }
}

variable "ami_id" {
  type = "map"

  default = {
    "us-west-1" = "ami-0e854fa49e70b76da"
    "us-west-2" = "ami-0661bd6af3b02a8d3"
  }
}

variable "instance_type" {
  type = "map"

  default = {
    "dev"  = "t2.medium"
    "prod" = "t2.large"
  }
}
