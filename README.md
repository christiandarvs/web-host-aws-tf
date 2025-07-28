# Simple Web Host using AWS EC2 and S3

## File Structure

```bash
├── README.md
├── terraform
│   ├── main.tf
│   ├── modules
│   │   ├── aws-ec2-instance
│   │   │   ├── init_script.sh
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   └── aws-s3-bucket
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   ├── outputs.tf
│   ├── Simple-Website-Key.pem
│   ├── terraform.tf
│   └── variables.tf
└── web
    ├── index.html
    └── style.css
```

## AWS Usage

- EC2: Used to host the website using a t2.micro instance.

- S3: Used to store static web files (HTML and CSS).

## TODO

It displays the default Apache index page instead of the website files stored in S3 (s3 bucket policy related)
