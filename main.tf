terraform {
  required_version = ">= 0.11.0"
}

locals {
  env       = "${element(split("_", terraform.workspace), 0)}"
  region    = "${element(split("_", terraform.workspace), 1)}"
  cidr_base = "${var.cidr_base[terraform.workspace]}"
}

provider "aws" {
  region = "${local.region}"
}
