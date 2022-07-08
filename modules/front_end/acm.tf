resource "aws_acm_certificate" "ssl_certificate" {
    domain_name = var.domain_name
    validation_method = "DNS"
    #the method used to do validation, DNS/Email
    provider = aws.acm_provider
    subject_alternative_names = ["*.${var.domain_name}"]
    #Set of domains that should be SANs in the issued certificate.
    #Subject Alternative Name

    lifecycle {
      create_before_destroy = true
    } 
}
#request DNS validated certificate
#deploy and wait complete

resource "aws_acm_certificate_validation" "bookinglet_cert_validation" {
    provider = aws.acm_provider
    certificate_arn = aws_acm_certificate.ssl_certificate.arn
    #The ARN of the certificate that is being validated.
    validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
    #list of FQDNs that implement the validation
    #FQDN = fully-qualified domain name
    #Only valid for DNS validation method ACM certificates
}