#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start
sudo echo '<h1>Welcome to my page!</h1> <p> This webserver is created using Terraform</p>' | sudo tee /var/www/html/index.html
