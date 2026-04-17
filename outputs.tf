output "web_app_url" {
  description = "URL d'acces a l'application web"
  value       = "http://localhost:${var.app_external_port}"
}

output "postgres_endpoint" {
  description = "Endpoint PostgreSQL local"
  value       = "localhost:${var.postgres_external_port}"
}

output "postgres_database" {
  description = "Nom de la base PostgreSQL"
  value       = var.postgres_db_name
}

output "postgres_user" {
  description = "Utilisateur PostgreSQL"
  value       = var.postgres_user
}

output "web_app_container_name" {
  description = "Nom du conteneur web"
  value       = docker_container.web_app.name
}

output "postgres_container_name" {
  description = "Nom du conteneur PostgreSQL"
  value       = docker_container.postgres.name
}


output "testing_CI/CD" {
  description = "Testing CI/CD pipeline"
  value       = "CI/CD pipeline is working correctly!"
}