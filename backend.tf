terraform {
  backend "s3" {
    bucket         = "makasiw7backet"
    key            = "terraform/state/dev/terraform.tfstate"  # Fixed for dev; change for other envs
    region         = "us-east-1"
    dynamodb_table = "makasiw7backet-lock"
  }
}