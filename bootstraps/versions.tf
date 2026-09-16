terraform {
  required_providers {
    aws = {
      version = "~> 5.52.0"
    }
    random = {
      version = "~> 3.6.2"
    }
  }

  required_version = "~> 1.16.2"

  backend "s3" {
    bucket       = "platform-on-eks-tfstate-618303855815"
    key          = "platform/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }


}

provider "aws" {
  region = "us-east-1"
}