# terraform {} 内では変数使用不可
terraform {
  required_version = "0.11.14"

  backend "s3" {
    region  = "ap-northeast-1"
    profile = "private"
    bucket  = "tf-ver-up-test"
    key     = "main/terraform.tfstate"
  }
}

provider "aws" {
  region  = "ap-northeast-1"
  profile = "private"
}

resource "aws_s3_bucket" "sugu_suteru_bucket" {
  bucket        = "sugu-suteru-bucket-${terraform.workspace}"
  acl           = "private"
  force_destroy = "true"
}
