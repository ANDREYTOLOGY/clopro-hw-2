resource "yandex_compute_instance_group" "lamp_group" {

  name               = "lamp-group"
  folder_id          = var.folder_id
  service_account_id = var.service_account_id

  instance_template {

    platform_id = "standard-v1"

    resources {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }

    boot_disk {

      initialize_params {
        image_id = "fd827b91d99psvq5fjit"
      }

    }

    network_interface {
      network_id = yandex_vpc_network.network.id
      subnet_ids = [yandex_vpc_subnet.public.id]
      nat        = true
    }

    metadata = {
      ssh-keys = "${var.ssh_user}:${var.public_key}"

      user-data = templatefile("${path.module}/cloud-init.yaml", {
        logo_url = "https://storage.yandexcloud.net/${yandex_storage_bucket.images.bucket}/${yandex_storage_object.logo.key}"
      })
    }

  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = [var.zone]
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion   = 1
  }

  health_check {
    interval            = 30
    timeout             = 10
    healthy_threshold   = 2
    unhealthy_threshold = 2

    http_options {
      port = 80
      path = "/"
    }
  }

}