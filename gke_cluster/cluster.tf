resource "google_container_cluster" "microservices" {
  name = "microservices"
  enable_autopilot = true
}