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
  description = "A set of Kafka topics to create."
  type        = set(string)
  default     = []
}

variable "database_users" {
  description = "A list of the cluster users."
  type        = map(map(string))
  default     = {}
}
