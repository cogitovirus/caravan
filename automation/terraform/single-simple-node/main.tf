provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region
}

resource "google_compute_instance" "nifi_instance" {
  name         = "nifi-instance"
  machine_type = "n1-standard-1"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Required for an external IP address
    }
  }

  metadata_startup_script = <<-EOT
    sudo apt-get update
    sudo apt-get install -y openjdk-11-jdk
    wget https://archive.apache.org/dist/nifi/${var.nifi_version}/nifi-${var.nifi_version}-bin.tar.gz
    tar -xvzf nifi-${var.nifi_version}-bin.tar.gz
    sudo mv nifi-${var.nifi_version} /opt/nifi
    
    modify the nifi.properties file with the desired port
    NIFI_HTTP_PORT=8080
    sudo sed -i "s/nifi.web.http.port=.*$/nifi.web.http.port=$${NIFI_HTTP_PORT}/" /opt/nifi/conf/nifi.properties
    
    sudo /opt/nifi/bin/nifi.sh start
  EOT

  tags = ["nifi-instance"]
}

resource "google_compute_firewall" "nifi_firewall" {
  name    = "nifi-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8080"] // Change this to the port you configured in nifi.properties
  }

  target_tags   = ["nifi-instance"]
  source_ranges = ["0.0.0.0/0"]
}
