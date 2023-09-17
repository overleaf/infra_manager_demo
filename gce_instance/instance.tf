resource "google_compute_instance" "overleaf" {
  name         = "overleaf"
  machine_type = "e2-medium"

  network_interface {
    network = "default"
  }

  boot_disk {
    initialize_params {
      image = "sharelatex/sharelatex"
    }
  }
}