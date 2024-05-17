output "id" {
  description = "The ID of the database cluster."
  value       = digitalocean_database_cluster.main.id
}

output "urn" {
  description = "The uniform resource name of the database cluster."
  value       = digitalocean_database_cluster.main.urn
}

output "host" {
  description = "Database cluster's hostname."
  value       = digitalocean_database_cluster.main.host
}

output "private_host" {
  description = "Same as host, but only accessible from resources within the account and in the same region."
  value       = digitalocean_database_cluster.main.private_host
}

output "port" {
  description = "Network port that the database cluster is listening on."
  value       = digitalocean_database_cluster.main.port
}

output "uri" {
  description = "The full URI for connecting to the database cluster."
  value       = digitalocean_database_cluster.main.uri
}

output "private_uri" {
  description = "Same as uri, but only accessible from resources within the account and in the same region."
  value       = digitalocean_database_cluster.main.private_uri
}

output "database" {
  description = "Name of the cluster's default database."
  value       = digitalocean_database_cluster.main.database
}

output "firewall_id" {
  description = "A unique identifier for the cluster's firewall."
  value       = digitalocean_database_firewall.main.id
}
