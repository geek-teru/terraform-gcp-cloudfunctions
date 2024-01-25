# Pub/Sub topic
resource "google_pubsub_topic" "topic" {
  name = var.pubsub_topic_vars["name"]
}

output "pubsub_topic_id" {
  value = google_pubsub_topic.topic.id
}
