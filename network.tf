resource "yandex_vpc_network" "network" {
  name = "netology-network"
}

resource "yandex_vpc_subnet" "public" {

  name           = "public"
  zone           = var.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = [var.public_subnet]
}

resource "yandex_vpc_route_table" "private" {

  name       = "private-route"
  network_id = yandex_vpc_network.network.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = var.nat_ip
  }
}

resource "yandex_vpc_subnet" "private" {

  name           = "private"
  zone           = var.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = [var.private_subnet]

  route_table_id = yandex_vpc_route_table.private.id
}
