resource "google_sql_database_instance" "mysql-from-terraform" {
  name             = "mysql-from-terraform"
  database_version = "MYSQL_8_0"
  region           = var.region

  settings {
    tier = var.tier
    disk_size         = var.disk_size
  

    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = var.private_network
      enable_private_path_for_google_cloud_services = true
      authorized_networks {
        name  = "bugaenko"
        value = var.external_ip
      }

    }
  }
  deletion_protection = "false"
}


resource "google_sql_database" "my-database-by-tf" {
  name     = "my-database-by-tf"
  instance = google_sql_database_instance.mysql-from-terraform.name
}


resource "google_sql_user" "myuser" {
  name     = var.name
  instance = google_sql_database_instance.mysql-from-terraform.name
  password = var.password
}