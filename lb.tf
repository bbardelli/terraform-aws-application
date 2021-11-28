resource "aws_lb" "application" {
  name               = "application-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.application_access.id]  

  enable_deletion_protection = false
  
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.application.arn
  port              = "8080"
  protocol          = "HTTP"  

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.application.arn
  }
}

resource "aws_lb_target_group" "application" {
  name     = "tf-application-lb-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}