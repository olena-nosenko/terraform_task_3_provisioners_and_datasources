resource "null_resource" "nginx" {
  triggers = {
    vm_id    = data.azurerm_virtual_machine.task3.id
    page_sha = fileexists("${path.module}/index.html") ? filesha256("${path.module}/index.html") : "not-found"
  }

  connection {
    type        = "ssh"
    host        = data.azurerm_virtual_machine.task3.public_ip_address
    user        = var.admin_username
    private_key = file(var.private_key_path)
    timeout     = "5m"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y nginx",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"
    ]
  }

  provisioner "file" {
    source      = "${path.module}/index.html"
    destination = "/tmp/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mv /tmp/index.html /var/www/html/index.html",
      "sudo chmod 644 /var/www/html/index.html",
      "sudo systemctl restart nginx"
    ]
  }
}