# Storage Bucket
module "bucket" {
  source = "../module/bucket"

  bucket_vars = var.bucket_vars
}

#Pub/Sub topic
module "pubsub_topic" {
  source = "../module/pubsub_topic"

  pubsub_topic_vars = var.pubsub_topic_vars
}

# Cloud Fanctions
module "function" {
  source = "../module/function"

  function_vars = var.function_vars

  source_archive_bucket_name = module.bucket.source_archive_bucket_name
  source_archive_object_name = module.bucket.source_archive_object_name
  pubsub_topic_id = module.pubsub_topic.pubsub_topic_id
}

# Cloud Schedulers
module "schedulers" {
  for_each = var.scheduler_vars
  source = "../module/scheduler"

  env = var.env
  target_log_name = each.key
  scheduler_name  = "${each.key}-watcher"
  scheduler_vars  = each.value
  pubsub_topic_id = module.pubsub_topic.pubsub_topic_id
}

module "monitoring" {
  source = "../module/monitoring"
  
  monitoring_vars = var.monitoring_vars
}