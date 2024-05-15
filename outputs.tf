output "id" {
  description = "A string value unique to the resource instance."
  value       = terraform_data.main.id
}

output "full_name" {
  description = "The full name of the resource."
  value       = terraform_data.main.output.full_name
}

output "byte_size" {
  description = "The size of the resource, in bytes."
  value       = terraform_data.main.output.byte_size
}
