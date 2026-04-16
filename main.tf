terraform {
  required_version = ">= 1.5.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "postgres" {
  name = "postgres:latest"
}

resource "docker_container" "postgres" {
  name  = "tp-iac-postgres"
  image = docker_image.postgres.image_id

  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=${var.postgres_db_name}"
  ]

  ports {
    internal = 5432
    external = var.postgres_external_port
  }
}

resource "docker_image" "web_app" {
  name = "tp-iac-webapp:latest"

  build {
    context    = path.module
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "web_app" {
  name  = "tp-iac-webapp"
  image = docker_image.web_app.image_id

  ports {
    internal = 80
    external = var.app_external_port
  }

  depends_on = [docker_container.postgres]
}
