variable "cluster_name" {
  description = "The name of the database cluster."
  type        = string
  nullable    = false
}

variable "droplet_size" {
  description = "Database Droplet size associated with the cluster."
  type        = string
  default     = "db-s-2vcpu-2gb"
}

variable "region" {
  description = "DigitalOcean region where the cluster will reside."
  type        = string
}

variable "node_count" {
  description = "Number of nodes that will be included in the cluster. At least 3."
  type        = number
  default     = 3
}

variable "kafka_version" {
  description = "Engine version used by the cluster."
  type        = string
  default     = "3.7"
}

variable "tags" {
  description = "A list of tag names to be applied to the database cluster."
  type        = set(string)
  default     = []
}

variable "private_network_uuid" {
  description = "The ID of the VPC where the database cluster will be located."
  type        = string
  default     = null
}

variable "project_id" {
  description = "The ID of the project that the database cluster is assigned to."
  type        = string
  default     = null
}

variable "maintenance_window_day" {
  description = "The day of the week on which to apply maintenance updates."
  type        = string
  default     = "tuesday"
}

variable "maintenance_window_hour" {
  description = "he hour in UTC at which maintenance updates will be applied in 24 hour format."
  type        = string
  default     = "23:00"
}

variable "storage_size_mib" {
  description = "Defines the disk size, in MiB, allocated to the cluster."
  type        = number
  default     = null
}

variable "allowed_ips" {
  description = "List of trusted IP addresses associated with the cluster."
  type        = set(string)
  default     = []
}

variable "topics" {
  description = "A map of Kafka topics to create."
  type = map(object({
    partition_count    = optional(number, 3)
    replication_factor = optional(number, 2)
    config = optional(object({
      cleanup_policy                      = optional(string)
      compression_type                    = optional(string)
      file_delete_delay_ms                = optional(number)
      flush_messages                      = optional(number)
      flush_ms                            = optional(number)
      index_interval_bytes                = optional(number)
      max_compaction_lag_ms               = optional(number)
      max_message_bytes                   = optional(number)
      message_down_conversion_enable      = optional(bool)
      message_format_version              = optional(string)
      message_timestamp_difference_max_ms = optional(number)
      message_timestamp_type              = optional(string)
      min_cleanable_dirty_ratio           = optional(number)
      min_insync_replicas                 = optional(number)
      preallocate                         = optional(bool)
      retention_bytes                     = optional(number)
      retention_ms                        = optional(number)
      segment_bytes                       = optional(number)
      segment_index_bytes                 = optional(number)
      segment_jitter_ms                   = optional(number)
      segment_ms                          = optional(number)
    }), {})
  }))
  default = {}
}

variable "database_users" {
  description = "A list of the cluster users."
  type        = map(map(string))
  default     = {}
}
