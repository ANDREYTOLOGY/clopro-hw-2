resource "yandex_storage_bucket" "images" {

  access_key = var.access_key
  secret_key = var.secret_key

  bucket = var.bucket_name

  anonymous_access_flags {
    read = true
    list = false
  }

}

resource "yandex_storage_object" "logo" {

  access_key = var.access_key
  secret_key = var.secret_key

  bucket = yandex_storage_bucket.images.bucket

  key = "logo.png"

  source = "${path.module}/images/logo.png"

  content_type = "image/png"

}
