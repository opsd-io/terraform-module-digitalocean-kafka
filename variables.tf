variable "name" {
  description = "A name for the test resource."
  type        = string
  nullable    = false
}

variable "parent_id" {
  description = "The ID of the parent resource. Change will trigger a recreation."
  type        = string
  default     = null
}

variable "size" {
  description = "A size for the test resource in MiB."
  type        = number
  default     = 256
}
