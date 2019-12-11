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
    type            = "lb_cookie"
    cookie_duration = "15"
    enabled         = true
  }
  # Alter the destination of the health check to be the login page.
  health_check {
    path = "/login"
    port = 80
  }
}

resource "aws_lb_target_group_attachment" "attachment" {
  count            = length(aws_instance.example)
  target_group_arn = aws_lb_target_group.group.arn
  target_id        = aws_instance.example[count.index].id
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

output "alb_dns" {
  value = aws_lb.alb.dns_name
}
