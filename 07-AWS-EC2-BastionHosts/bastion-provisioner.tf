resource "null_resource" "bastion_copy_keys" {
  depends_on = [module.bastion_ec2_instance]
  # Connection block for provisioners to connect to EC2 instance
  connection {
    type = "ssh"
    host = aws_eip.bastion_eip.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("${path.module}/private-key/us-east-1-key.pem")
  }

  # File provisioner

  provisioner "file" {
    source = file("${path.module}/private-key/us-east-1-key.pem")
    destination = "/tmp/us-east-1-key.pem"
  }

  # remote exec provisioner to fix the file permission of private key

  provisioner "remote-exec" {
    inline = ["sudo chmod 400 /tmp/us-east-1-key.pem"]
  }

  # local exec provisioner

  provisioner "local-exec" {
    command = "echo VPC created on `date` and VPD ID: ${module.vpc.vpc_id} >> vpc-creation-time.txt"
    working_dir = "${path.module}/local-exec-provisioner-files"
  }
}