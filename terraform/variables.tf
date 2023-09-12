variable "user" {
  description = "Username to connect to the machines (It could be username of your host)"
  type        = string
  sensitive   = false
}

variable "worker_image" {
  description = "OS image id for worker"
  type        = string
  sensitive   = false
  default     = "debian-cloud/debian-12"
}

variable "region" {
  default     = "me-west1"
  description = "Region to create cluster on it"
  sensitive   = false
  type        = string
}

variable "zone" {
  default     = "me-west1-a"
  description = "Zone to create cluster on it"
  sensitive   = false
  type        = string
}

variable "credentials_path" {
  default     = "credentials.json"
  description = "Credentials JSON file path to use GCP API"
  sensitive   = false
  type        = string
}

variable "project_id" {
  description = "GCP project id"
  sensitive   = false
  type        = string
}
