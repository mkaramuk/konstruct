# Ansible inventory and config
resource "local_file" "ansible_inventory" {
  content = templatefile("./templates/inventory", {
    master_ip  = google_compute_instance.master.network_interface.0.access_config.0.nat_ip
    worker1_ip = google_compute_instance.worker1.network_interface.0.access_config.0.nat_ip
    worker2_ip = google_compute_instance.worker2.network_interface.0.access_config.0.nat_ip
  })
  filename = "../ansible/inventory"
}

resource "local_file" "ansible_config" {
  content = templatefile("./templates/ansible.cfg", {
    user = var.user
  })
  filename = "../ansible/ansible.cfg"
}

resource "local_file" "public_key" {
  content  = tls_private_key.ssh_key.public_key_openssh
  filename = "../authentication/ssh_keys/${var.user}_vm_key.pub"
}
