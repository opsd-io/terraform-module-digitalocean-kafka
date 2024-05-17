terraform {
  required_version = ">= 1.5.5"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.34.1"
    }
  }
}

resource "digitalocean_database_cluster" "main" {
  name                 = var.cluster_name
  engine               = "kafka"
  version              = var.kafka_version
  size                 = var.droplet_size
  region               = var.region
  node_count           = var.node_count
  tags                 = var.tags
  private_network_uuid = var.private_network_uuid
  project_id           = var.project_id
  storage_size_mib     = var.storage_size_mib

  maintenance_window {
    day  = var.maintenance_window_day
    hour = var.maintenance_window_hour
  }
}

resource "digitalocean_database_kafka_topic" "main" {
  for_each   = var.topics
  cluster_id = digitalocean_database_cluster.main.id
  name       = each.key
}

resource "digitalocean_database_user" "main" {
  for_each   = var.database_users
  cluster_id = digitalocean_database_cluster.main.id
  name       = each.key

  settings {
    dynamic "acl" {
      for_each = each.value
      content {
        topic      = acl.key
        permission = acl.value
      }
    }
  }
}

resource "digitalocean_database_firewall" "main" {
  cluster_id = digitalocean_database_cluster.main.id

  dynamic "rule" {
    for_each = var.allowed_ips

    content {
      type  = "ip_addr"
      value = rule.value
    }
  }
}
