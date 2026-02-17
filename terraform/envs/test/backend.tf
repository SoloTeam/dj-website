terraform {
  backend "gcs" {
    bucket = "dj-website-terraform-state-2026"
    prefix = "test/terraform/state"
  }
}