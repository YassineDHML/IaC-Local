variable "postgres_user" {
  description = "Nom d'utilisateur PostgreSQL"
  type        = string
  default     = "tp_user"
}

variable "postgres_password" {
  description = "Mot de passe PostgreSQL"
  type        = string
  default     = "new_password"
  sensitive   = true
}

variable "postgres_db_name" {
  description = "Nom de la base PostgreSQL"
  type        = string
  default     = "tp_database"
}

variable "postgres_external_port" {
  description = "Port local expose pour PostgreSQL"
  type        = number
  default     = 5432
}

variable "app_external_port" {
  description = "Port local expose pour l'application web"
  type        = number
  default     = 8080
}
