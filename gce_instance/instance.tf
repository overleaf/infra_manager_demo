data "google_compute_image" "cos" {
  family = "cos-stable"
  project = var.project_id
}

resource "google_compute_instance" "overleaf" {
  name         = "overleaf"
  machine_type = "e2-medium"
  project      = var.project_id
  zone         = var.zone

  network_interface {
    network = "default"
  }

  boot_disk {
    initialize_params {
      image = data.google_compute_image.cos.self_link
    }
  }

  metadata = {
    gce-container-declaration = yamldecode(file("container.yaml"))
  }
}