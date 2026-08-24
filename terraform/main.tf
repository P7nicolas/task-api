terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_ecr_repository" "task_api" {
  name = var.repository_name

  image_scanning_configuration {
    scan_on_push = true
  }
}