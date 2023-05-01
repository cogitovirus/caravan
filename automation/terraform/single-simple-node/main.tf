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
    image = "ubuntu-os-cloud/ubuntu-2204-lts"
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
  sudo apt-get install -y unzip
  sudo apt-get install -y openjdk-11-jdk
  echo 'export JAVA_HOME=$(readlink -f $(which java) | sed \"s:bin/java::\")' | sudo tee -a /etc/profile.d/java.sh
  sudo chmod +x /etc/profile.d/java.sh

  wget https://dlcdn.apache.org/nifi/${var.nifi_version}/nifi-${var.nifi_version}-bin.zip
  unzip nifi-${var.nifi_version}-bin.zip
  sudo mv nifi-${var.nifi_version} /opt/nifi
  
  # modify the nifi.properties file with the desired port
  NIFI_HTTP_PORT=8080
  sudo sed -i "s/nifi.web.http.port=.*$/nifi.web.http.port=$${NIFI_HTTP_PORT}/" /opt/nifi/conf/nifi.properties
  
  source /etc/profile.d/java.sh
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
