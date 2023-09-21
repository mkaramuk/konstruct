resource "google_compute_disk" "master-disk" {
  project = var.project_id
  name    = "konstruct-master-disk"
  type    = "pd-balanced"
  zone    = var.zone
  size    = 10
  image   = "debian-cloud/debian-12"
}

resource "google_compute_disk" "worker-disk" {
  count   = 2
  project = var.project_id
  name    = "konstruct-worker${count.index + 1}-disk"
  type    = "pd-balanced"
  zone    = var.zone
  size    = 10
  image   = var.worker_image
}
