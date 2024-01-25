terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.4.0"
    }
  }
}

provider "google" {
  credentials = "${file("your_service_account_key")}"
  project = var.project
  region  = "asia-northeast1"
}

terraform {
  backend "gcs" {
    # prdとdevで異なるため、backend_configで指定する
  }
}
