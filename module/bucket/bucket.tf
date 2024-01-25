# Storage Bucket
resource "google_storage_bucket" "bucket" {
  name          = var.bucket_vars["name"]
  location      = var.bucket_vars["location"]
  storage_class = var.bucket_vars["storage_class"]
}

# Cloud Functions source code
data "archive_file" "function_src" {
  type        = "zip"
  source_dir  = "./src"
  output_path = "./src.zip"
}

resource "google_storage_bucket_object" "object" {
  # オブジェクト名が更新されないとCloudFunctionsが更新されないのでmd5のハッシュをつける
  name   = "src/bq-log-watcher-function_${data.archive_file.function_src.output_md5}.zip"
  bucket = google_storage_bucket.bucket.name
  source = data.archive_file.function_src.output_path
}

output "source_archive_bucket_name" {
  value = google_storage_bucket.bucket.name
}

output "source_archive_object_name" {
  value = google_storage_bucket_object.object.name
}