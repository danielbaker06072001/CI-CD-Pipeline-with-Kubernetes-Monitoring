terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "put your access key here"
  secret_key = "put your secret key here"
}
