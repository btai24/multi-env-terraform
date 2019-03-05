resource "aws_iam_instance_profile" "this" {
  name_prefix = "${format("%s-%s-profile", local.env, local.region)}"
  role        = "${aws_iam_role.this.name}"
}

resource "aws_iam_role" "this" {
  name_prefix = "${format("%s-%s-role", local.env, local.region)}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "this" {
  name_prefix = "${format("%s-%s-role-policy", local.env, local.region)}"
  role        = "${aws_iam_role.this.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject"],
      "Resource": "arn:aws:s3:::btai-artifacts/*"
    }
  ]
}
EOF
}
