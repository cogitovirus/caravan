variable "project_id" {
  description = "The project ID in GCP"
  default = "caravan-385016"
}

variable "region" {
  description = "The region where resources will be created"
  default     = "us-central1"
}

variable "zone" {
  description = "The zone where the VM will be created"
  default     = "us-central1-a"
}

variable "credentials_file" {
  description = "The path to the GCP service account JSON key file"
  default = "~/account.json"
}

variable "nifi_version" {
  description = "The version of Apache NiFi to install"
  default = "1.21.0"
}
