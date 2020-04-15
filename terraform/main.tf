/**
 * Setup AWS provider.
 */
provider "aws" {
  region = var.region
}

data "aws_caller_identity" "current" {}

terraform {
  backend "s3" {
    key = "terraform.tfstate"
    encrypt = true
  }
}
