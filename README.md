## 概要
- CloudScheduler+Pub/SubでCloudFunctionsを定期的に実行する。

### 前提
* tfbackendやproviderブロックにサービスアカウントの鍵の場所を記述しておく
* Slack アプリを作成し、xoxb-で始まるトークンを発行しておく。
* 以下のAPIを有効化しておく。
  * https://console.cloud.google.com/apis/api/monitoring.googleapis.com/
  * https://console.cloud.google.com/apis/api/pubsub.googleapis.com
  * https://console.cloud.google.com/apis/api/cloudfunctions.googleapis.com
  * https://console.cloud.google.com/apis/api/cloudscheduler.googleapis.com
  * https://console.cloud.google.com/apis/api/eventarc.googleapis.com
  * https://console.cloud.google.com/apis/api/run.googleapis.com
  * https://console.cloud.google.com/apis/api/cloudbuild.googleapis.com
* PubSubの認証でデフォルトで使用されるservice-{PROJECT_NUMBER}@gcp-sa-pubsub.iam.gserviceaccount.com に「サービス アカウント トークン作成者」ロールを付与しておく。


### Terraform実行手順
```
# ディレクトリ移動
cd bq-log-watcher/dev

#init
terraform init -backend-config="dev.tfbackend"

# plan
terraform plan -var-file=dev.tfvars

# apply
terraform apply -var-file=dev.tfvars
```