locals {
  # Формируем имена ВМ с помощью интерполяции
  vm_web_name = "web-${var.vm_web_zone}-${var.vm_web_memory}gb"
  vm_db_name  = "db-${var.vm_db_zone}-${var.vm_db_memory}gb"
}