variable "HEROKU_API_KEY" {
  type = string
  description = "Api key utilizada no heroku"
}

variable "HEROKU_EMAIL" {
  type = string
  description = "Heroku email"
}


provider  "heroku" {
  email = var.HEROKU_EMAIL
  api_key = var.HEROKU_API_KEY
}

terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "~> 4.0"
    }
  }
}

resource "heroku_app" "default" {
  name = "vacations-labs-go"
  region = "eu"

  buildpacks = [
    "heroku/go"
  ]
}

resource "heroku_addon" "database" {
  app = heroku_app.default.name
  plan = "heroku-postgresql:hobby-dev"
}