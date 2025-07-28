provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

   resource "null_resource" "flask_port_change" {
   triggers = {
     port = var.flask_port
   }
 }
 
resource "google_compute_instance" "default" {
  name         = "dj-website-vm"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network       = "default"
    access_config {}  # Needed for external IP
  }
    metadata = {
      port = var.flask_port
      startup-script = file("startup-script.sh")
    }
  
  tags = ["http-server"]
  
  /*lifecycle {
    replace_triggered_by = [
      null_resource.flask_port_change,
      null_resource.startup_script_change
    ]
  }
*/

   lifecycle {
    replace_triggered_by = [null_resource.flask_port_change]
  }
}

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = [var.flask_port]
  }
  
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["http-server"]
  description = "Allow inbound HTTP on the ${var.flask_port}"
}
