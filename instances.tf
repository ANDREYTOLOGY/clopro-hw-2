resource "yandex_compute_instance" "nat" {

  name = "nat-instance"

  platform_id = "standard-v1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {

    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
      size     = 10
    }

  }

  network_interface {

    subnet_id  = yandex_vpc_subnet.public.id
    ip_address = var.nat_ip

    nat = true
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.public_key}"
  }
}
