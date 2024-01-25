# Cloud Scheduler
resource "google_cloud_scheduler_job" "schedule" {
  name        = var.scheduler_name
  description = ""

  schedule    = var.scheduler_vars["schedule"]
  time_zone   = "JST"

  # devなら一時停止をtrue、prdならfalse
  paused = ( var.env == "dev")

  pubsub_target {
    topic_name = var.pubsub_topic_id
    data       = base64encode(var.target_log_name)
  }

  retry_config {
    retry_count = 2
  }
}
