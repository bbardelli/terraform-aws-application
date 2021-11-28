provider "aws" {
  region = var.region
}

data "aws_subnet_ids" "selected_vpc" {
  vpc_id = var.vpc_id
}
