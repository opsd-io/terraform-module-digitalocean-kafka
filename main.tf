terraform {
  required_version = ">= 1.5.5"

  required_providers {
    # aws = {
    #   source  = "hashicorp/aws"
    #   version = ">= 5.0.0"
    # }
    # azurerm = {
    #   source  = "hashicorp/azurerm"
    #   version = ">= 3.0.0"
    # }
    # digitalocean = {
    #   source  = "digitalocean/digitalocean"
    #   version = ">= 2.0.0"
    # }
    # github = {
    #   source  = "integrations/github"
    #   version = ">= 6.0.0"
    # }
    # vault = {
    #   source  = "hashicorp/vault"
    #   version = ">= 3.0.0"
    # }
  }
}

resource "terraform_data" "main" {
  triggers_replace = {
    parent_id = var.parent_id
  }
  input = {
    full_name = upper(var.name),
    byte_size = var.size * 1024 * 1024,
  }
}
