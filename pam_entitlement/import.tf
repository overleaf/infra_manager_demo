import {
  id = "projects/${var.project_id}/locations/global/entitlements/gcs-admin"
  to = google_privileged_access_manager_entitlement.gcs-admin
}