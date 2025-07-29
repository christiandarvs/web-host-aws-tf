module "ec2-instance" {
  source        = "./modules/aws-ec2-instance"
  instance_name = "Web Server"
}


module "s3-bucket" {
  source      = "./modules/aws-s3-bucket"
  bucket_name = "my-simple-website-bucket-darvin"
  tags = {
    "Name"        = "My Simple Website Bucket",
    "Environment" = "Dev",
  }
}

