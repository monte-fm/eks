resource "aws_lb" "public" {
  name               = "public-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [
      aws_subnet.web_subnet_a.id,
      aws_subnet.web_subnet_b.id,
      aws_subnet.web_subnet_c.id
  ]

  enable_deletion_protection = true

  tags = {
    Environment = "Public ALB"
  }
}