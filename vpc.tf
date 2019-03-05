resource "aws_vpc" "this" {
  cidr_block           = "${local.cidr_base}.0.0/16"
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"

  tags {
    Name = "vpc-${local.env}-${local.region}"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = "${aws_vpc.this.id}"

  depends_on = ["aws_vpc.this"]
}

resource "aws_subnet" "this" {
  vpc_id     = "${aws_vpc.this.id}"
  cidr_block = "${local.cidr_base}.192.0/20"

  availability_zone       = "${local.region}b"
  map_public_ip_on_launch = "true"

  depends_on = ["aws_vpc.this"]

  tags {
    Name = "${local.env}-${local.region}"
  }
}

resource "aws_route_table" "this" {
  vpc_id = "${aws_vpc.this.id}"

  depends_on = ["aws_vpc.this"]
}

resource "aws_route" "internet_gateway" {
  route_table_id         = "${aws_route_table.this.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.this.id}"

  depends_on = [
    "aws_vpc.this",
    "aws_internet_gateway.this",
  ]
}

resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.this.id}"
  route_table_id = "${aws_route_table.this.id}"

  depends_on = [
    "aws_subnet.this",
    "aws_route_table.this",
  ]
}
