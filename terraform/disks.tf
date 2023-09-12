resource "google_compute_disk" "master-disk" {
  project = var.project_id
  name    = "konstruct-master-disk"
  type    = "pd-balanced"
  zone    = var.zone
  size    = 10
  image   = "debian-cloud/debian-12"
}

resource "google_compute_disk" "worker1-disk" {
  project = var.project_id
  name    = "konstruct-worker1-disk"
  type    = "pd-balanced"
  zone    = var.zone
  size    = 10
  image   = var.worker_image
}

resource "google_compute_disk" "worker2-disk" {
  project = var.project_id
  name    = "konstruct-worker2-disk"
  type    = "pd-balanced"
  zone    = var.zone
  size    = 10
  image   = var.worker_image
}
