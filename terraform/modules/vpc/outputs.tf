output "private_network" {
  value = google_compute_network.vpc_network.id
}

output "subnetwork" {
  value = google_compute_subnetwork.vpc-subnet.id
}


