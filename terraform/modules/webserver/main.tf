resource "google_compute_instance" "final-task-server" {
  name = "basecamp-final-task"
  machine_type = var.machine_type

  boot_disk {
    source = google_compute_disk.os-disk.name
    auto_delete = false
    }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    access_config {
    }
  }
  tags = ["bc-firewall"]
}

resource "google_compute_disk" "os-disk" {
  name   = "os-disk"
  type   = "pd-balanced"
  image  = "ubuntu-2004-focal-v20230213"
  size   = 30
  zone   = var.zone
}

resource "google_compute_project_metadata" "my_ssh_key" {
  metadata = {
    ssh-keys = <<EOF
      svjtosha:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1pvNKZh/0dRFXkz/qRVFKXhSri0R9F47v2p2G2CdRIEyeHoqK7g7EkatwWhT50ZsWs78oZKd8hD8rU4K4HTGvGRNkDZDozhcv0WF62SaUmlwabriUZuaykr9qkzwmh+G8mdZZjUYilr9LhfJGseX+5D6BZcj02xMSkZLC1HL3jX4vpZBF3WrX1AatsrR0nQ0gP82ymLcNRYBW8eD8Zg/zRLoLspdc+ZTrMFFFuqdp6dwDxqNoo8ws2EumhHz4Md1MfZJaMbIvju0wHK85zgLUc7LmJy8O7BO43g3X7Fam/9c5YnMtWJQmuLN9Vy3g0O0nMBn1pIkieluPkI4iOrcHmP+Ikud5aQ8VUklRT/Dhd0ZkLCaXOZNsG9x9Fazm02SSOLFMfE1k2iFthUVTQP7FyOdjxdny+wQZcqAiN7+dul0IJ9uAs87DzjRW5kJAjTyUkiJ2zier0qcGLSGb/3XfauE5nb5dA6xbtR7pZhq4YhTuzcVJp9RoHY+1deoW19Jq6p6/t6OdHwJoRLdvNHxDaijdu+ufo1J4py8gzIFNpj2QUbs3CPlI5UwRXbC6LqbfA3KzWg63CKH4SRC5HUxQzAOCEwevZ+vIJvo57v83bFq40jkNaTBzpMlDw+lAKMjreuaVBAuASb4tUr4tDozFhnIwCM6Ev+j8j7D53XCsXQ== svjtosha@home-edition
      
    EOF
  }
}