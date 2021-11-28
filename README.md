application terraform module
===========

A terraform module to provide a <application infrastructure> in AWS

This version provides a single instance internet facing connection at port 8080 for applications

Module Input Variables
----------------------

- `aminame` - string - name of the ami with code
- `region` - string - name of the region to be applied
- `vpc_id` - string - VPC id for application infrastructure
- `instance_type` - string(Optional) - type of instance used (t3.small is default)



Usage
-----

```hcl
module "application" {
  source  = "app.terraform.io/company-foobar/application/aws"
  version = "x.y.z"
  ami_name = "packer-linux-aws-python-app"
  region = "us-east-1"
  vpc_id = var.vpc_id
}
```


Outputs
=======

 - `endpoint` - published endpoint
 - `security_group_id` - compte security group
 - `compute_role` - isntance role used


Authors
=======

name.surname@company.com