variable "ip_cidr_range" {
  default = "10.2.0.0/16"
}

variable "allow_ports" {
  type    = list(any)
  default = ["80", "443", "22", "8080" ]

}

variable "prefix_length" {
  default = 16
}

variable project {}

variable region {}