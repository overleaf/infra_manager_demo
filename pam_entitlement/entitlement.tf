resource "google_privileged_access_manager_entitlement" "gcs-admin" {
    provider =  google-beta
    entitlement_id = "gcs-admin"
    location = "global"
    max_request_duration = "3600s"
    parent = "projects/${var.project_id}"
    requester_justification_config {    
        unstructured{}
    }
    eligible_users {
        principals = [
            "user:christopher.hoskin.test@gmail.com",
            "user:christopher.hoskin@sharelatex.com",
        ]
    }
    privileged_access{
        gcp_iam_access{
            role_bindings{
                role = "roles/storage.admin"
            }
            resource = "//cloudresourcemanager.googleapis.com/projects/${var.project_id}"
            resource_type = "cloudresourcemanager.googleapis.com/Project"
        }
    }
    additional_notification_targets {
        admin_email_recipients     = [
          "christopher.hoskin@overleaf.com",
        ]
    }
    approval_workflow {
    manual_approvals {
      require_approver_justification = true
      steps {
        approvals_needed          = 1
        approvers {
          principals = ["user:christopher.hoskin@overleaf.com"]
        }
      }
    }
  }
}