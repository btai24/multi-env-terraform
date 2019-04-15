variable "cidr_base" {
  type = "map"
}

variable "asg_min_size" {
  type = "map"
}

variable "asg_max_size" {
  type = "map"
}

variable "ami_id" {
  type = "map"
}

variable "instance_type" {
  type = "map"
}

variable "ssl_certificate_arn" {
  type = "map"
}

variable "domain_name" {
  type = "string"
}
