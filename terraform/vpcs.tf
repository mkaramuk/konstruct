resource "google_compute_network" "vpc_network" {
  name                    = "konstruct-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
}
