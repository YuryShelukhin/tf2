# Переменные для подсетей
variable "subnet_zone_a_vm_web" {
  description = "Name of subnet in zone A"
  type        = string
  default     = "develop-zone-a"
}

variable "subnet_zone_b_vm_db" {
  description = "Name of subnet in zone B"
  type        = string
  default     = "develop-zone-b"
}

variable "subnet_zone_a_cidr" {
  description = "CIDR block for subnet in zone A"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_zone_b_cidr" {
  description = "CIDR block for subnet in zone B"
  type        = string
  default     = "10.0.2.0/24"
}

variable "subnet_zone_a_zone" {
  description = "Zone for subnet A"
  type        = string
  default     = "ru-central1-a"
}

variable "subnet_zone_b_zone" {
  description = "Zone for subnet B"
  type        = string
  default     = "ru-central1-b"
}


# Переменные для ВМ vm_web
variable "vm_db_name" {
  description = "Name of the web virtual machine"
  type        = string
  default     = "netology-develop-platform-db"
}

variable "vm_db_platform_id" {
  description = "Platform ID for db VM"
  type        = string
  default     = "standard-v3"
}

#variable "vm_db_cores" {
#  description = "Number of CPU cores for web VM"
#  type        = number
#  default     = 2
#}

# variable "vm_db_memory" {
#   description = "Memory size in GB for web VM"
#   type        = number
#   default     = 2
# }

# variable "vm_db_core_fraction" {
#   description = "CPU core fraction for web VM"
#   type        = number
#   default     = 20
# }

variable "vm_db_image" {
  description = "Image family for db VM"
  type        = string
  default     = "ubuntu-2004-lts"
}

# variable "vm_db_disk_size" {
#   description = "Boot disk size in GB for web VM"
#   type        = number
#   default     = 5
# }

# variable "vm_db_disk_type" {
#   description = "Boot disk type for web VM"
#   type        = string
#   default     = "network-hdd"
# }

variable "vm_db_nat" {
  description = "Enable NAT for db VM"
  type        = bool
# default     = true изменил значение для задания 9
  default     = false
}

variable "vm_db_zone" {
  description = "Zone for VM-db"
  type        = string
  default     = "ru-central1-b"
}

# Переменные для образа
variable "vm_db_image_family" {
  description = "Family of the image for db VM"
  type        = string
  default     = "ubuntu-2004-lts"
}