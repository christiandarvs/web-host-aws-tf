#!/bin/bash
sudo yum update -y
sudo yum install -y httpd awscli

sudo systemctl enable httpd
sudo systemctl start httpd

sudo aws s3 sync s3://my-simple-website-bucket-darvin /var/www/html

sudo chmod -R 755 /var/www/html
