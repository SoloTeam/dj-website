variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}
# The port Flask should bind to and firewall should allow
variable "flask_port" {
  description = "Port the Flask app listens on"
  type        = number
  default     = 5003 # Default for FLASK, can be overwritten from .tfvars
}

/*
# cloud-sql.tf (new file or append)
resource "google_sql_database_instance" "dj-cloud-sql" {
  name             = "dj-website-db"
  database_version = "POSTGRES_15"
  region           = var.region
  settings { tier = "db-f1-micro" } # tiny; good for demo; resize later
}

resource "google_sql_database" "app" {
  name     = "djdb"
  instance = google_sql_database_instance.dj.name
}

resource "google_sql_user" "app" {
  name     = "djuser"
  instance = google_sql_database_instance.dj.name
  password = var.db_password
}
*/