terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


provider "aws" {

  region                   = "eu-west-1"
  shared_config_files      = ["/home/ocar/.aws/config"]
  shared_credentials_files = ["/home/ocar/.aws/credentials"]
}