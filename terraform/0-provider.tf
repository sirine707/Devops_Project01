provider "aws" {
  region = "eu-west-3"
  profile ="sirinekloud"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}