resource "aws_route53_record" "this" {
  zone_id = "Z1Y4FEML24L94W"
  name    = "${local.env}-${local.region}"
  type    = "CNAME"
  ttl     = "5"
  records = ["${aws_elb.this.dns_name}"]

  depends_on = ["aws_autoscaling_group.this"]
}
