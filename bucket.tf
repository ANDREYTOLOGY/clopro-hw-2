resource "yandex_storage_bucket" "images" {

  access_key = var.access_key
  secret_key = var.secret_key

  bucket = var.bucket_name

  anonymous_access_flags {
    read = true
    list = false
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.bucket_key.id
        sse_algorithm     = "aws:kms"
      }
    }
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
