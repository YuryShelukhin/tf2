resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop_zone_a" {
  name           = var.subnet_zone_a_vm_web
  zone           = var.subnet_zone_a_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [var.subnet_zone_a_cidr]
}

resource "yandex_vpc_subnet" "develop_zone_b" {
  name           = var.subnet_zone_b_vm_db
  zone           = var.subnet_zone_b_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [var.subnet_zone_b_cidr]
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}

resource "yandex_compute_instance" "platform" {
  name        = var.vm_web_name
  platform_id = var.vm_web_platform_id
  zone        = var.vm_web_zone

  resources {
    cores         = var.vm_web_cores
    memory        = var.vm_web_memory
    core_fraction = var.vm_web_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = var.vm_web_disk_size
      type     = var.vm_web_disk_type
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_zone_a.id
    nat       = var.vm_web_nat
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${file(var.vms_ssh_root_key)}"
  }

}


resource "yandex_compute_instance" "netology-develop-platform-db" {
  name        = var.vm_db_name
  platform_id = var.vm_db_platform_id
  zone        = var.vm_db_zone

  resources {
    cores         = var.vm_db_cores
    memory        = var.vm_db_memory
    core_fraction = var.vm_db_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = var.vm_db_disk_size
      type     = var.vm_db_disk_type
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_zone_b.id
    nat       = var.vm_db_nat
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${file(var.vms_ssh_root_key)}"
  }

}

