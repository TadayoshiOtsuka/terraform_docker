terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.17.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Manage tfstate remotely and consider a Lock mechanism as well
