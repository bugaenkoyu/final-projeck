output "private_network" {
  value = "${module.myapp-vpc.private_network}"
}

output "subnetwork" {
  value = "${module.myapp-vpc.subnetwork}"
}

output "external_ip"{
  value = "${module.webserver.external_ip}"
}
