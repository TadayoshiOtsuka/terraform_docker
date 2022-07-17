terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.17.0"
    }
  }

  backend "s3" {
    bucket         = ""
    region         = "ap-northeast-1"
    key            = "terraform.tfstate"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}
