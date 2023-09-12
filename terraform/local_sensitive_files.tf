resource "local_sensitive_file" "private_key" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "../authentication/ssh_keys/${var.user}_vm_key"
}
