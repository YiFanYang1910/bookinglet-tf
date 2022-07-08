variable "bucket_name" {
    description = "the name of the bucket without www in front"
    type = string
}

variable "domain_name"{
    description = "the webiste name of the domain"
    type = string
}

variable "zone_id" {
  description = "The id of your hosted zone you want to apply for your project"
}

# variable "acm_certificate"{
#     description = "certificate of this domain name"
# }
variable "certificate_arn"{
    description = "create in ACM"
 }
