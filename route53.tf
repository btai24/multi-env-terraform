resource "aws_route53_record" "this" {
  zone_id = "Z1Y4FEML24L94W"
  name    = "${local.env}-${local.region}"
  type    = "A"

  alias {
    name                   = "dualstack.${aws_elb.this.dns_name}"
    zone_id                = "${aws_elb.this.zone_id}"
    evaluate_target_health = false
  }
}
