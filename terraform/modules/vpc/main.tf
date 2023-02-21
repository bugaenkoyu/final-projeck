# Subnet
resource "google_compute_subnetwork" "vpc-subnet" {
  name          = "subnetwork"
  ip_cidr_range = var.ip_cidr_range 
  region        = var.region
  network       = google_compute_network.vpc_network.id

}

# Create a VPC network
resource "google_compute_network" "vpc_network" {
  project                 = var.project
  name                    = "vpc-network"
}

# Create an IP address
resource "google_compute_global_address" "private_ip" {
  name          = "private-ip"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = var.prefix_length
  network       = google_compute_network.vpc_network.id
}

# Create a private connection
resource "google_service_networking_connection" "private_vpc" {
  network                 = google_compute_network.vpc_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip.name]
}

resource "google_compute_firewall" "bc-firewall" {
  name    = "bc-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = var.allow_ports
  }

  source_ranges = ["0.0.0.0/0"]

  depends_on = [
    google_compute_network.vpc_network
  ]
}