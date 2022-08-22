terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}

provider "aws" {
  profile = "wortech"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "replace-me"
  instance_type = "t2.micro"

  tags = {
    Name = "WortechAppServerInstance"
  }
}
