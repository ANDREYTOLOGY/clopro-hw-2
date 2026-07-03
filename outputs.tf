output "public_vm_ip" {
  value = yandex_compute_instance.public_vm.network_interface[0].nat_ip_address
}

output "nat_public_ip" {
  value = yandex_compute_instance.nat.network_interface[0].nat_ip_address
}

output "private_vm_ip" {
  value = yandex_compute_instance.private_vm.network_interface[0].ip_address
}

output "logo_url" {

  value = "https://storage.yandexcloud.net/${yandex_storage_bucket.images.bucket}/${yandex_storage_object.logo.key}"

}

output "kms_key_id" {
  value = yandex_kms_symmetric_key.bucket_key.id
}
