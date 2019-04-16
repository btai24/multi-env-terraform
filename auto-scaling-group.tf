data "template_file" "user_data" {
  template = "${file("./template/user_data.sh.tmpl")}"

  vars {
    environment = "${local.env}"
    region      = "${local.region}"
  }
}

resource "aws_launch_configuration" "this" {
  name_prefix                 = "${terraform.workspace}"
  image_id                    = "${var.ami_id[local.region]}"
  instance_type               = "${var.instance_type[local.env]}"
  iam_instance_profile        = "${aws_iam_instance_profile.this.arn}"
  user_data                   = "${data.template_file.user_data.rendered}"
  enable_monitoring           = false
  ebs_optimized               = false
  associate_public_ip_address = true
  security_groups             = ["${aws_security_group.api.id}"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "this" {
  name                      = "${terraform.workspace}"
  max_size                  = "${var.asg_max_size[local.env]}"
  min_size                  = "${var.asg_min_size[local.env]}"
  launch_configuration      = "${aws_launch_configuration.this.name}"
  vpc_zone_identifier       = ["${aws_subnet.this.id}"]
  load_balancers            = ["${aws_elb.this.name}"]
  health_check_type         = "ELB"
  wait_for_capacity_timeout = "3m"
  min_elb_capacity          = "${var.asg_min_size[local.env]}"

  depends_on = ["aws_subnet.this"]

  tags = [
    {
      key                 = "Environment"
      value               = "${local.env}"
      propagate_at_launch = true
    },
    {
      key                 = "Region"
      value               = "${local.region}"
      propagate_at_launch = true
    },
  ]
}
