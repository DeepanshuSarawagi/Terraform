# Terraform
This repository is created to learn Terraform for provisioning infrastructure

# Download Terraform and export it in path
- Download the [Terraform for macOS](https://www.terraform.io/downloads)
- Copy the ./terraform executable file under /usr/local/bin
- Run the following command to export the above location to PATH
- $export PATH=$PATH:/usr/local/bin

# AWS Command to determine which EC2 instance type offering is available in AZ
$aws ec2 describe-instance-type-offerings --location-type availability-zone  --filters Name=instance-type,Values=t3.micro --region us-east-1 --output table

