resource "google_compute_instance" "worker1" {
  name         = "konstruct-worker1"
  machine_type = "e2-micro"
  tags         = ["konstruct-vm"]
  zone         = var.zone

  metadata = {
    ssh-keys = "${var.user}:${local_file.public_key.content}"
  }

  boot_disk {
    auto_delete = false
    source      = google_compute_disk.worker1-disk.self_link
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id

    access_config {
      # Existince of this block provides an external IP to the VM
    }
  }
}

resource "google_compute_instance" "worker2" {
  name         = "konstruct-worker2"
  machine_type = "e2-micro"
  tags         = ["konstruct-vm"]
  zone         = var.zone

  metadata = {
    ssh-keys = "${var.user}:${local_file.public_key.content}"
  }

  boot_disk {
    auto_delete = false
    source      = google_compute_disk.worker2-disk.self_link
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id

    access_config {
      # Existince of this block provides an external IP to the VM
    }
  }
}

