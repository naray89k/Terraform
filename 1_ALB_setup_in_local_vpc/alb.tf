resource "aws_lb" "alb" {
  name               = "vaanu-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.vaanu-alb-sg.id]
  subnets            = aws_default_subnet.default_subnets.*.id
  tags = {
    Environment = "vaanu-alb"
  }
}

resource "aws_lb_target_group" "group" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default.id
  stickiness {
    type = "lb_cookie"
  }
  # Alter the destination of the health check to be the login page.
  health_check {
    path = "/login"
    port = 80
  }
}

resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.group.arn
  target_id        = aws_instance.example.id
  port             = 80
}

resource "aws_lb_listener" "listener_http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.group.arn
    type             = "forward"
  }
}
