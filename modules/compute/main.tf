resource "azurerm_network_interface" "web" {
  count = var.web_vm_count

  name                = "${var.name_prefix}-web-nic-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.web_subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "azurerm_network_interface" "app" {
  count = var.app_vm_count

  name                = "${var.name_prefix}-app-nic-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.app_subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "app" {
  count = var.app_vm_count

  name                = "${var.name_prefix}-app-vm-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size

  admin_username                  = var.admin_username
  disable_password_authentication = true

  network_interface_ids = [
    azurerm_network_interface.app[count.index].id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  zone = var.app_zones[count.index]

  custom_data = base64encode(<<-EOF
    #cloud-config
    package_update: true
    packages:
      - python3

    runcmd:
      - mkdir -p /opt/app
      - |
        cat > /opt/app/app.py <<'PYEOF'
        from http.server import BaseHTTPRequestHandler, HTTPServer
        import socket

        class Handler(BaseHTTPRequestHandler):
            def do_GET(self):
                response = f"""
                Application Server: {socket.gethostname()}
                Status: Healthy
                """
                self.send_response(200)
                self.send_header("Content-Type", "text/plain")
                self.end_headers()
                self.wfile.write(response.encode())

        server = HTTPServer(("0.0.0.0", 8080), Handler)
        server.serve_forever()
        PYEOF
      - nohup python3 /opt/app/app.py > /var/log/app.log 2>&1 &

    EOF
  )

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "web" {
  count = var.web_vm_count

  name                = "${var.name_prefix}-web-vm-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size

  admin_username                  = var.admin_username
  disable_password_authentication = true

  network_interface_ids = [
    azurerm_network_interface.web[count.index].id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  zone = var.web_zones[count.index]

  custom_data = base64encode(<<-EOF
    #cloud-config
    package_update: true
    packages:
      - nginx

    write_files:
      - path: /etc/nginx/sites-available/app
        permissions: "0644"
        content: |
          upstream backend {
              server ${azurerm_network_interface.app[0].private_ip_address}:8080;
              server ${azurerm_network_interface.app[1].private_ip_address}:8080;
          }

          server {
              listen 80 default_server;
              listen [::]:80 default_server;

              location / {
                  proxy_pass http://backend;
                  proxy_set_header Host $host;
                  proxy_set_header X-Real-IP $remote_addr;
                  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
              }
          }

    runcmd:
      - rm -f /etc/nginx/sites-enabled/default
      - ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/app
      - nginx -t
      - systemctl restart nginx
      - systemctl enable nginx

    EOF
  )

  tags = var.tags
}