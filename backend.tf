terraform {
  backend "s3" {
    bucket         = "your-s3-bucket-name"
    key            = "terraform/state/dev/terraform.tfstate"  # Fixed for dev; change for other envs
    region         = "us-east-1"
    dynamodb_table = "your-s3-bucket-name-lock"
  }
}