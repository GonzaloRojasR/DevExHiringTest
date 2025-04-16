variable "cluster_name" {
  type        = string
  description = "Nombre del cluster EKS"
}

variable "alert_email" {
  type        = string
  description = "Correo para recibir notificaciones"
}
