#!/bin/bash
sudo yum update -y
sudo yum install -y httpd awscli -y

sudo systemctl enable httpd
sudo systemctl start httpd

sleep 5

sudo aws s3 sync s3://my-simple-website-bucket-darvin /var/www/html

sudo chmod -R 755 /var/www/html
