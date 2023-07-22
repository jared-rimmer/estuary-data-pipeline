variable "project_id" {
  type      = string
  sensitive = true
}

variable "region" {
  type      = string
  sensitive = false
}

variable "zone" {
  type      = string
  sensitive = false
}

variable "account_email" {
  type      = string
  sensitive = true
}
