###cloud vars
variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

###ssh vars
variable "vms_ssh_root_key" {
  type        = string
  default     = "/home/yury/HW/terraform/02/secrets/yandex-cloud-key.pub"
  description = "ssh-keygen -t ed25519"
}


# Переменные для ВМ vm_web
variable "vm_web_name" {
  description = "Name of the web virtual machine"
  type        = string
  default     = "netology-develop-platform-web"
}

variable "vm_web_platform_id" {
  description = "Platform ID for web VM"
  type        = string
  default     = "standard-v3"
}

#variable "vm_web_cores" {
#  description = "Number of CPU cores for web VM"
# type        = number
#  default     = 2
#}

#variable "vm_web_memory" {
#  description = "Memory size in GB for web VM"
#  type        = number
#  default     = 1
#}

#variable "vm_web_core_fraction" {
#  description = "CPU core fraction for web VM"
#  type        = number
#  default     = 50
#}

variable "vm_web_image" {
  description = "Image family for web VM"
  type        = string
  default     = "ubuntu-2004-lts"
}

/*
variable "vm_web_disk_size" {
  description = "Boot disk size in GB for web VM"
  type        = number
  default     = 5
}

variable "vm_web_disk_type" {
  description = "Boot disk type for web VM"
  default     = "network-hdd"
}
*/

variable "vm_web_nat" {
  description = "Enable NAT for web VM"
  type        = bool
  default     = true
}

variable "vm_web_zone" {
  description = "Zone for web VM"
  type        = string
  default     = "ru-central1-a"
}

# Переменные для образа
variable "vm_web_image_family" {
  description = "Family of the image for web VM"
  type        = string
  default     = "ubuntu-2004-lts"
}

# Единая map переменная для ресурсов всех ВМ
variable "vms_resources" {
  description = "Resources configuration for all VMs"
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    disk_size      = number
    disk_type      = string
  }))

  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 50
      disk_size      = 5
      disk_type      = "network-hdd"
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      disk_size      = 5
      disk_type      = "network-hdd"
    }
  }
}

# Общая метаданная для всех ВМ
variable "common_metadata" {
  description = "Common metadata for all VM instances"
  type = map(string)
  default = {
    serial-port-enable = "1"
  }
}


# Тестовая переменная для задания 8
variable "test" {
  description = "List of servers with SSH commands and IP addresses"
  type = list(
    map(
      list(string)
    )
  )
  default = []
}