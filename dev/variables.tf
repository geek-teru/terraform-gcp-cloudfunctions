variable "project" {
  type = string
}

variable "env" {
  type = string
}

variable "bucket_vars" {
  type = map
}

variable pubsub_topic_vars {
  type = map
}

variable "function_vars" {
  type = map
}

variable "scheduler_vars" {
  type = map
}

variable "monitoring_vars" {
  type = map
}
