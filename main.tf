resource "tls_private_key" "generate_ssh_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "private_key_pem" {
  content         = tls_private_key.generate_ssh_key_pair.private_key_pem
  filename        = var.ssh_key_name
  file_permission = "0600"
}

resource "local_file" "public_key_pem" {
  content         = tls_private_key.generate_ssh_key_pair.public_key_pem
  filename        = "${var.ssh_key_name}-pub"
  file_permission = "0600"
}

