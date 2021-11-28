data "aws_ami" "app"{
    most_recent = true
    owners = ["self"]

    filter {
        name   = "name"
        values = [var.ami_name]
    }
}

resource "aws_launch_configuration" "as_conf" {
  name_prefix   = "terraform-lc-application-"
  image_id      = data.aws_ami.app.id
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.application_profile.id
  user_data = <<EOF
        #!/bin/bash
        sudo echo '${var.db_endpoint}' >> /var/application/config.db        
        EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "application_asg" {  
  desired_capacity   = 2
  max_size           = 2
  min_size           = 1
  launch_configuration = aws_launch_configuration.as_conf.name
  target_group_arns = [aws_lb_target_group.application.id]
}