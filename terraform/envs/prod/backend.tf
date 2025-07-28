terraform {
  backend "gcs" {
    bucket = "dj-website-terraform-state-2025"
    prefix = "prod/terraform/terraform"
  }
}