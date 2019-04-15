resource "aws_security_group" "elb" {
  name   = "${local.env}-${local.region}-elb"
  vpc_id = "${aws_vpc.this.id}"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 8080          # HTTP
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = ["aws_subnet.this"]

  tags {
    Environment = "${local.env}"
    Region      = "${local.region}"
  }
}

resource "aws_security_group" "api" {
  name   = "${local.env}-${local.region}-api"
  vpc_id = "${aws_vpc.this.id}"

  ingress {
    from_port = 22    # SSH
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "75.82.29.86/32",
    ]
  }

  ingress {
    from_port = 8080  # HTTP
    to_port   = 8080
    protocol  = "tcp"

    security_groups = [
      "${aws_security_group.elb.id}",
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = ["aws_subnet.this"]

  tags {
    Environment = "${local.env}"
    Region      = "${local.region}"
  }
}
