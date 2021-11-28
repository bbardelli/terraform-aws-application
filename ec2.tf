data "aws_ami" "app"{
    most_recent = true
    owners = ["self"]

    filter {
        name   = "name"
        values = [var.ami_name]
    }
}

resource aws_instance "web"{
    ami = data.aws_ami.app.id
    instance_type = var.instance_type    
    associate_public_ip_address = true
    iam_instance_profile = aws_iam_instance_profile.application_profile.id
    vpc_security_group_ids = [aws_security_group.application_access.id]
    user_data = <<EOF
        #!/bin/bash
        sudo echo 'ENV-TEST=${var.db_endpoint}' >> /etc/environment
        sudo export ENV-TEST=${var.db_endpoint}
        EOF
    

}