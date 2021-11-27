variable vpc_id {
  description = "VPC ID"
  type = string
}
variable ami_name{
    type = string
}
variable region {
    type = string
}
variable instance_type{
    type = string
    default = "t3.small"
}