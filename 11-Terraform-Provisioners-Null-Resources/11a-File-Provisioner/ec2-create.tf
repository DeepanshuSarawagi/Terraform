resource "aws_instance" "ec2-east" {
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  availability_zone      = var.az
  key_name               = var.key_name
  user_data              = file("${path.module}/apache-install.sh")
  count                  = terraform.workspace == "default" ? 2 : 1 // If workspace == default spin up 2 instance else spin 1 instance
  vpc_security_group_ids = [aws_security_group.vpc_ssh_web.id]
  tags = {
    Name = "My-${terraform.workspace}-Webserver-${count.index}"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("terraform-key-win.pem")
  }

  provisioner "file" {
    source      = "product-landing-page.html"
    destination = "/tmp/product-landing-page.html"
  }

  provisioner "file" {
    content     = "ami used: ${self.ami}"
    destination = "/tmp/file.log"
  }

#  provisioner "file" {
#    source      = "product-landing-page.html"
#    destination = "/var/www/html/product-landing-page.html"
#    on_failure  = continue # This will continue creating resources even though provisioner fails
#  }

  provisioner "remote-exec" {
    inline = [
      "sleep 90",
      "sudo cp /tmp/product-landing-page.html /var/www/html/product-landing-page.html"
    ]
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> local-exec.txt"
    working_dir = "${path.module}/local-exec"
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo Provisioned AWS instance ${self.public_dns} destroyed at %date% >> local-exec.txt"
    working_dir = "${path.module}/local-exec"
  }
}