resource "google_secret_manager_secret" "secret-basic" {
  secret_id = "testsecret"

    annotations = {
        key1 = "Initial value"
    }

  replication {
    auto {}
  }
}