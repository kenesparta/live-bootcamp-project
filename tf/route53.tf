data "aws_route53_zone" "main" {
  name = var.main_dns
}

resource "aws_route53_record" "main_dns" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.main_dns
  type    = "A"
  ttl     = 60
  records = [aws_eip.application_host.public_ip]
}

resource "aws_route53_record" "api_auth_service" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "api.${var.main_dns}"
  type    = "A"
  ttl     = 60
  records = [aws_eip.application_host.public_ip]
}

resource "aws_route53_record" "app_service" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "app.${var.main_dns}"
  type    = "A"
  ttl     = 60
  records = [aws_eip.application_host.public_ip]
}

resource "aws_route53_record" "ssh_service" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "ssh.${var.main_dns}"
  type    = "A"
  ttl     = 60
  records = [aws_eip.application_host.public_ip]
}
