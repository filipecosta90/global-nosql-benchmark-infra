# Provider

provider "aws" {
  alias   = "us_west_1"
  profile = "default"
  region  = "us-west-1"
}


provider "aws" {
  alias   = "eu_west_3"
  profile = "default"
  region  = "eu-west-3"
}


provider "aws" {
  alias   = "sa_east_1"
  profile = "default"
  region  = "sa-east-1"
}


provider "aws" {
  alias   = "ap_south_1"
  profile = "default"
  region  = "ap-south-1"
}


provider "aws" {
  alias   = "ap_northeast_1"
  profile = "default"
  region  = "ap-northeast-1"
}





################################################################################
# This is the bucket holding this specific setup tfstate
################################################################################
terraform {
  backend "s3" {
    key    = "presentations/global-nosql-benchmark-infra.tfstate"
    bucket = "performance-cto-group"
    region = "us-east-1"
  }
}
