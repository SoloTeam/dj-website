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
  default     = 5000 # optional: will be overridden
}