# Ansible inventory and config
resource "local_file" "ansible_inventory" {
  content = templatefile("./templates/inventory.ini", {
    worker_ip_addrs = google_compute_instance.worker[*].network_interface.0.access_config.0.nat_ip
    master_ip       = google_compute_address.master_external_ip.address
  })
  filename = "../ansible/inventory.ini"
}

resource "local_file" "ansible_config" {
  content = templatefile("./templates/ansible.cfg", {
    user = var.user
  })
  filename = "../ansible/ansible.cfg"
}

# SSH key
resource "local_file" "public_key" {
  content  = tls_private_key.ssh_key.public_key_openssh
  filename = "../authentication/ssh_keys/${var.user}_vm_key.pub"
}

# kubeadm init script
resource "local_file" "reassign-ip" {
  content = templatefile("./templates/kinit.sh", {
    master_external_ip = google_compute_address.master_external_ip.address
  })
  filename = "../scripts/kinit.sh"
}

