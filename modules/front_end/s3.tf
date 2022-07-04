resource "aws_s3_bucket" "jamesbookingletlink" {
    bucket = "www.${var.bucket_name}" 
    acl = "public-read"
    policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[{
    "Sid":"PublicReadForGetBucketObjects",
        "Effect":"Allow",
      "Principal": "*",
      "Action":"s3:GetObject",
      "Resource":["arn:aws:s3:::www.${var.bucket_name}/*"
      ]
    }
    ]
    }
POLICY

website {
    index_document = "index.html"
    error_document = "error.html"
}
}

resource "aws_s3_bucket" "jamesbookingletlinksub" {
    bucket = "${var.bucket_name}" 
    acl = "public-read"
    policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[{
    "Sid":"PublicReadForGetBucketObjects",
        "Effect":"Allow",
      "Principal": "*",
      "Action":"s3:GetObject",
      "Resource":["arn:aws:s3:::${var.bucket_name}/*"
      ]
    }
    ]
    }
POLICY

website {
    redirect_all_requests_to = "https://www.${var.domain_name}"
}
}




