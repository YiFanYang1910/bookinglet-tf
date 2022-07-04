resource "aws_route53_record" "bookingletjames" {
  zone_id = var.zone_id
  name = "www.${var.domain_name}"
  type = "A"

  alias {
    name                   = aws_cloudfront_distribution.jamesbookingletlinkcd.domain_name
    zone_id                = aws_cloudfront_distribution.jamesbookingletlinkcd.hosted_zone_id
    #The ID of the hosted zone to contain this record
    evaluate_target_health = false
    #fill cloudfront distribution's name and zone_id
  }
}

resource "aws_route53_record" "bookingletjamessub" {
  zone_id = var.zone_id
  name = var.domain_name
  type = "A"

  alias {
    name                   = aws_cloudfront_distribution.jamesbookingletsubcd.domain_name
    zone_id                = aws_cloudfront_distribution.jamesbookingletsubcd.hosted_zone_id
    evaluate_target_health = false
  }
}
