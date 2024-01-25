# Common
project = "geek-teru-test"
env = "dev"

# Storage Bucket
bucket_vars = {
  name          = "geek-teru-test-function-src"
  location      = "ASIA-NORTHEAST1"
  storage_class = "STANDARD"
}

#Pub/Sub topic
pubsub_topic_vars = {
  name = "test-topic"
}

# Cloud Fanctions
function_vars = {
  name                  = "test-function"
  description           = "test"
  runtime               = "python311"
  available_memory_mb   = 256
  timeout               = 60
  entry_point           = "main"
  service_account_email = "invoke-cloudfunction@geek-teru-test.iam.gserviceaccount.com"
}

# Cloud Scheduler
scheduler_vars = {
  test-schedule = {
    schedule    = "*/10 * * * *"
  }
}

# Monitoring
monitoring_vars = {
  notification = {
    display_name = "test-function-notification"
    slack_channel_name = "#testworkspace"
    slack_auth_token = "xoxb-6509062426210-6506276380149-SV0VmAIUv6a1FiiG2pIgs1u9"
  }
  alert_policy = {
    display_name = "test-function-alertpolicy"
    filter = "resource.type=\"cloud_function\" resource.labels.function_name=\"test-function\" severity=\"ERROR\""
    content = "test-functionが異常終了しました。"
    period = "600s"
    auto_close = "86400s" #24h
  }
}

