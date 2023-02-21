provider "google" {
  credentials = file("devops-bc-terraform.json")
  project = var.project
  region = var.region
  zone = var.zone

}

module "myapp-vpc" {
  source = "./modules/vpc"
  project = var.project
  region = var.region
}


module "webserver" {
  source = "./modules/webserver"
  machine_type = var.machine_type
  network = module.myapp-vpc.private_network
  subnetwork = module.myapp-vpc.subnetwork
  zone = var.zone

}

/*
module "database" {
  source = "./modules/database"
  tier = var.tier
  disk_size         = var.disk_size
  name     = var.name
  password = var.password
  external_ip = module.webserver.external_ip
  private_network = module.vpc.private_network
}
*/