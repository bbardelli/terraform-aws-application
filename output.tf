output "endpoint"{
    value = aws_lb.application.dns_name
}

output "security_group_id"{
    value = aws_security_group.application_access.id
}

output "compute_role_arn"{
    value = aws_iam_role.app_role.arn
}

output "compute_role_name"{
    value = aws_iam_role.app_role.name
}