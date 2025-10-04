resource "aws_route53_record" "webapp_failover" {
  zone_id = var.zone_id
  name    = "webapp.example.com"
  type    = "A"
  set_identifier = "us-east"
  failover       = "PRIMARY"
  ttl            = 60
  records        = [aws_lb.east.dns_name]
  health_check_id = aws_route53_health_check.alb_us_east.id
}

resource "aws_route53_record" "webapp_failover_backup" {
  zone_id = var.zone_id
  name    = "webapp.example.com"
  type    = "A"
  set_identifier = "us-west"
  failover       = "SECONDARY"
  ttl            = 60
  records        = [aws_lb.west.dns_name]
  health_check_id = aws_route53_health_check.alb_us_west.id
}
