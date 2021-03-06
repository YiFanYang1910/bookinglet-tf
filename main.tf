terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  #define terraform version

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-southeast-2"
  shared_credentials_files = ["/home/ubuntu/.aws/credentials"]
  //shared_credentials_files = ["/Users/sjq/.aws/credentials"]

}

provider "aws" {
  alias = "acm_provider"
  region = "us-east-1"
}

module "front_end_terraform"{
    source = "./modules/front_end"
    bucket_name = "jamesbookinglet.link"
    domain_name = "jamesbookinglet.link"
    #在不同的测试环境下定义不同的S3 bucket name
    # region = "ap-southeast-2"
    # environment = terraform.workspace
    zone_id = "Z07447952DDK3PDNX6NZV"
    //acm_certificate = var.acm_certificate
    certificate_arn = "arn:aws:acm:us-east-1:219392032829:certificate/6d9ab804-b45b-4086-8194-660bbb480572"
    //certificate_arn1 = "arn:aws:acm:us-east-1:219392032829:certificate/6d9ab804-b45b-4086-8194-660bbb480572"
}

module "back_end_terraform" {
  source = "./modules/back_end"
  ecs_name = "jamesbookingletecs"
  ecr_name = "jamesbookingletecr"
  security_group = "jamesbookingletsecgroup"
  
}
