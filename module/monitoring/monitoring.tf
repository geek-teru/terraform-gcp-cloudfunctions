# Monitoring
resource "google_monitoring_notification_channel" "channel" {
  display_name = var.monitoring_vars.notification.display_name
  type         = "slack"
  labels = {
    "channel_name" = var.monitoring_vars.notification.slack_channel_name
  }
  sensitive_labels {
    auth_token = var.monitoring_vars.notification.slack_auth_token
  }
}
resource "google_monitoring_alert_policy" "policy" {
  display_name = var.monitoring_vars.alert_policy.display_name
  combiner     = "OR"

  conditions {
    display_name = var.monitoring_vars.alert_policy.display_name
    condition_matched_log {
      filter = var.monitoring_vars.alert_policy.filter
    }
  }

  notification_channels = [ google_monitoring_notification_channel.channel.id ]
  alert_strategy {
    notification_rate_limit {
      period = var.monitoring_vars.alert_policy.period
    }
    auto_close = var.monitoring_vars.alert_policy.auto_close
  }

  documentation {
    content = var.monitoring_vars.alert_policy.content
  }
}