resource "aws_elb" "this" {
  name                      = "${local.env}-${local.region}-elb"
  security_groups           = ["${aws_security_group.elb.id}"]
  subnets                   = ["${aws_subnet.this.id}"]
  cross_zone_load_balancing = true

  internal = false

  listener = [
    {
      lb_port           = 80
      lb_protocol       = "http"
      instance_port     = 8080
      instance_protocol = "http"
    },
  ]

  idle_timeout                = 30
  connection_draining         = true
  connection_draining_timeout = 30

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:8080/ping"
    interval            = 10
  }

  depends_on = ["aws_subnet.this"]

  tags {
    Environment = "${local.env}"
    Region      = "${local.region}"
  }
}
