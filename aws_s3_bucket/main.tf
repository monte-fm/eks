provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-aws-configuration"
  acl    = "private"

  versioning {
    enabled = true
  }
}