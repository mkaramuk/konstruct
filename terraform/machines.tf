resource "google_compute_instance" "master" {
  name         = "konstruct-master"
  machine_type = "e2-small"
  tags         = ["konstruct-vm"]
  zone         = var.zone

  metadata = {
    ssh-keys = "${var.user}:${local_file.public_key.content}"
  }

  boot_disk {
    auto_delete = false
    source      = google_compute_disk.master-disk.self_link
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {
      # Existince of this block provides an external IP to the VM
    }
  }
}

resource "google_compute_instance" "worker" {
  count        = 2
  name         = "konstruct-worker${count.index + 1}"
  machine_type = "e2-small"
  tags         = ["konstruct-vm"]
  zone         = var.zone

  metadata = {
    ssh-keys = "${var.user}:${local_file.public_key.content}"
  }

  boot_disk {
    auto_delete = false
    source      = element(google_compute_disk.worker-disk.*.self_link, count.index)
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id

    access_config {
      # Existince of this block provides an external IP to the VM
    }
  }
}

