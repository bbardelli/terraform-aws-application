data "aws_ami" "app"{
    most_recent = true
    owners = ["self"]

    filter {
        name   = "name"
        values = [var.ami_name]
    }
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = "EC2-compliance"
}

resource aws_instance "web"{
    ami = data.aws_ami.app.id
    instance_type = var.instance_type    
    associate_public_ip_address = true
    iam_instance_profile = aws_iam_instance_profile.test_profile.name

}