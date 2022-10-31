terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


provider "aws" {

  region                   = "us-east-1"
  shared_config_files      = ["/Users/ocar/.aws/config"]
  shared_credentials_files = ["/Users/ocar/.aws/credentials"]
  profile                  = "omnipro"
}