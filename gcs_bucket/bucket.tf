resource "google_storage_bucket" "csh-2024-06-11-lifecycle-test" {
  name          = "csh-2024-06-11-lifecycle-test"
  location      = "us-east1"
  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type          = "Delete"
      storage_class = null
    }
    condition {
      days_since_noncurrent_time = 90
    }
  }


}