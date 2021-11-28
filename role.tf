data "aws_iam_policy" "AmazonSSMManagedInstanceCore" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "application_profile" {
  name = "test_profile"
  role = aws_iam_role.app_role.name
}


resource "aws_iam_role" "app_role" {
  name = "app_role"
  path = "/"

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

resource "aws_iam_role_policy_attachment" "ssm-attach" {
  role       = aws_iam_role.app_role.name
  policy_arn = data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn
}