provider "aws" {
    region = "us-east-1"
    profile = "default"
  
}

terraform {
  required_version = ">=1.8"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">=5.0"
    }
  }
}