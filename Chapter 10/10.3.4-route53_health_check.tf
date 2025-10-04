resource "aws_route53_health_check" "alb_us_east" {
  fqdn              = aws_lb.east.dns_name
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = 3
  request_interval  = 30
}
