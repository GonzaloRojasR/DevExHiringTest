terraform {
  backend "s3" {
    bucket         = "gr-bucket-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
