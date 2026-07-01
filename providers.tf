terraform {
  required_version = ">= 1.5"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.140"
    }
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

provider "aws" {
  alias                       = "storage"
  access_key                  = var.access_key
  secret_key                  = var.secret_key
  region                      = "ru-central1"
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true

  endpoints {
    s3 = "https://storage.yandexcloud.net"
  }
}
