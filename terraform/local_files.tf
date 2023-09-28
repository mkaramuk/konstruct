# Ansible inventory and config
resource "local_file" "ansible_inventory" {

  content  = join("\n", concat(google_compute_instance.worker[*].network_interface.0.access_config.0.nat_ip, [google_compute_instance.master.network_interface.0.access_config.0.nat_ip]))
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
