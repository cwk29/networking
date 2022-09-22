terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.15.0"
    }
  }

  required_version = "1.2.7"

  cloud {
    organization = "wortech"

    workspaces {
      name = "networking-dev"
    }
  }
}
