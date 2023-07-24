resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http_for_alb.id]
  subnets            = [aws_subnet.subnet[0].id, aws_subnet.subnet[1].id]

  enable_deletion_protection = false

  tags = {
    Environment = "tynybay_loadblancer"
  }
}

resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = var.http_port
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"  
    target_group_arn = aws_lb_target_group.test.arn
  }
}



