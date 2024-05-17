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
  for_each = var.topics

  cluster_id         = digitalocean_database_cluster.main.id
  name               = each.key
  partition_count    = each.value.partition_count
  replication_factor = each.value.replication_factor
  config {
    cleanup_policy                      = each.value.config.cleanup_policy
    compression_type                    = each.value.config.compression_type
    file_delete_delay_ms                = each.value.config.file_delete_delay_ms
    flush_messages                      = each.value.config.flush_messages
    flush_ms                            = each.value.config.flush_ms
    index_interval_bytes                = each.value.config.index_interval_bytes
    max_compaction_lag_ms               = each.value.config.max_compaction_lag_ms
    max_message_bytes                   = each.value.config.max_message_bytes
    message_down_conversion_enable      = each.value.config.message_down_conversion_enable
    message_format_version              = each.value.config.message_format_version
    message_timestamp_difference_max_ms = each.value.config.message_timestamp_difference_max_ms
    message_timestamp_type              = each.value.config.message_timestamp_type
    min_cleanable_dirty_ratio           = each.value.config.min_cleanable_dirty_ratio
    min_insync_replicas                 = each.value.config.min_insync_replicas
    preallocate                         = each.value.config.preallocate
    retention_bytes                     = each.value.config.retention_bytes
    retention_ms                        = each.value.config.retention_ms
    segment_bytes                       = each.value.config.segment_bytes
    segment_index_bytes                 = each.value.config.segment_index_bytes
    segment_jitter_ms                   = each.value.config.segment_jitter_ms
    segment_ms                          = each.value.config.segment_ms
  }
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
