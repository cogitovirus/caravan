provider "google" {
  credentials = "${file("~/.config/gcloud/application_default_credentials.json")}"
  project     = var.project
  region      = var.region
  zone        = var.zone
}