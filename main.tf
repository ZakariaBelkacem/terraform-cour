### Backend definition

# terraform {
#   # The configuration for this backend will be filled in by Terragrunt
#   backend "s3" {}
# }



data "aws_vpcs" "foo" {
  filter = {
    cidr = "172.16.0.0/16"
  }
}

resource "aws_lb" "load_balancer" {
  name               = "${var.app_name}-alb-private"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.lb_sg.id}"]
  subnets            = ["${aws_subnet.private.*.id}"]
  enable_deletion_protection = true
}

resource "aws_subnet" "private" {
    count = "${length(var.aws_azs)}"
    cidr_block = "${cidrsubnet(var.vpc_cidr,4,count.index+4)}"
    vpc_id = "${aws_vpc.vpc.id}"
    tags = {
        Name = "${var.vpc_name}-private-${var.aws_azs[count.index]}"
    }
}

### Module Main

