terraform {
  required_version = "~> 1.13.4"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.165.0"
    }
  }
}

provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.default_zone
  service_account_key_file = file("/home/yury/HW/terraform/02/secrets/authorized_key.json")
}
