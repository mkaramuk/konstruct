resource "google_compute_firewall" "ssh" {
  name = "konstruct-master"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.vpc_network.id
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["konstruct-vm"]
}

resource "google_compute_firewall" "kube-apiserver" {
  name = "konstruct-kube-apiserver"
  allow {
    ports    = ["6443"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.vpc_network.id
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["konstruct-vm"]
}
