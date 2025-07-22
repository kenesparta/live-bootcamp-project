data "aws_route53_zone" "main" {
  name = "rustybootcamp.xyz"
}

resource "aws_route53_record" "api_auth_service" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "api.rustybootcamp.xyz"
  type    = "A"
  ttl     = 300
  records = [aws_instance.application_host.public_ip]
}

resource "aws_route53_record" "app_service" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "app.rustybootcamp.xyz"
  type    = "A"
  ttl     = 300
  records = [aws_instance.application_host.public_ip]
}

resource "aws_route53_record" "ssh_service" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "ssh.rustybootcamp.xyz"
  type    = "A"
  ttl     = 300
  records = [aws_instance.application_host.public_ip]
}
