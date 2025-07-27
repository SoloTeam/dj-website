terraform {
  backend "gcs" {
    bucket = "dj-website-terraform-state-2025"
    prefix = "test/terraform/state"
  }
}