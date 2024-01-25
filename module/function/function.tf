# Cloud Functions
resource "google_cloudfunctions2_function" "function" {
  name        = var.function_vars["name"]
  location    = "asia-northeast1"
  description = var.function_vars["description"]

  build_config {
    runtime     = var.function_vars["runtime"]
    entry_point = var.function_vars["entry_point"]
    source {
      storage_source {
        bucket = var.source_archive_bucket_name
        object = var.source_archive_object_name
      }
    }
  }
  service_config {
    available_memory = "256M"
    service_account_email = var.function_vars["service_account_email"]
    timeout_seconds = var.function_vars["timeout"]

  }
  event_trigger {
    event_type    = "google.cloud.pubsub.topic.v1.messagePublished"
    pubsub_topic  = var.pubsub_topic_id
    service_account_email = var.function_vars["service_account_email"] # roles/iam.serviceAccountTokenCreator 権限付与
    retry_policy  = "RETRY_POLICY_RETRY"
  }
}
