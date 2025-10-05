terraform {
  required_version = ">= 1.5.0"  # Minimum Terraform version

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # AWS provider (allows patch updates, e.g., 5.1.x)
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"  # For S3 bucket uniqueness
    }
  }
}