resource "google_compute_firewall" "ssh" {
  name = "konstruct-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.vpc_network.id
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["konstruct-vm"]
}

resource "google_compute_firewall" "kube_apiserver" {
  name = "konstruct-kube-apiserver"
  allow {
    ports    = ["6443"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.vpc_network.id
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["konstruct-vm-master"]
}

resource "google_compute_firewall" "internal_ingress" {
  name          = "konstruct-internal-ingress"
  direction     = "INGRESS"
  network       = google_compute_network.vpc_network.id
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["konstruct-vm"]

  allow {
    protocol = "all"
    ports    = []
  }
}

resource "google_compute_firewall" "internal_egress" {
  name          = "konstruct-internal-egress"
  direction     = "EGRESS"
  network       = google_compute_network.vpc_network.id
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["konstruct-vm"]

  allow {
    protocol = "all"
    ports    = []
  }
}
