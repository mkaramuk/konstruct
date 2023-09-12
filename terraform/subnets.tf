resource "google_compute_subnetwork" "subnet" {
  name          = "konsturct-subnet"
  ip_cidr_range = "10.0.1.0/29"
  region        = var.region
  network       = google_compute_network.vpc_network.id
}
