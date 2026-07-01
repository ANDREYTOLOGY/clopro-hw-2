data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

data "yandex_compute_image" "lamp" {
  image_id = "fd827b91d99psvq5fjit"
}
