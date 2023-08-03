# CloudFront Terraform Module - README

## Terraform CloudFront Module for Static Site

This Terraform module creates an Amazon CloudFront distribution with an S3 bucket as the origin, providing a scalable and performant way to serve a static site globally.

Usage

```
module "cloudfront_static_site" {
  source                 = "path/to/cloudfront"
  region                 = "us-east-1"  # Change this to your desired AWS region
  origin_domain          = "your-static-site-bucket-name"  # Change this to the S3 bucket hosting your static site
  origin_id              = "your-unique-origin-id"  # Change this to a unique identifier for the CloudFront origin
  custom_ssl_certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/abcd1234-abcd-1234-abcd-1234abcd5678"  # Optional: Use your custom SSL certificate ARN
  logging_bucket         = "your-cloudfront-logs-bucket"  # Optional: Specify the S3 bucket for CloudFront access logs
  logging_prefix         = "cloudfront-logs/"  # Optional: Set the prefix for CloudFront access logs (default: "cloudfront-logs/")
  price_class            = "PriceClass_200"  # Optional: Set the price class for CloudFront (default: "PriceClass_All")
}

output "cloudfront_domain_name" {
  value = module.cloudfront_static_site.cloudfront_domain_name
}


```

Variables:
- `region` (required): The AWS region where the CloudFront 
-`distribution` should be created.
- `origin_domain` (required): The domain name of the S3 bucket to be used as the CloudFront origin.
- `origin_id` (required): A unique identifier for the CloudFront origin.
- `custom_ssl_certificate_arn` (optional): The ARN of the custom SSL certificate to be used (default: ""). Leave it empty for the default CloudFront certificate.
- `logging_bucket` (optional): The S3 bucket where CloudFront will store access logs.
- `logging_prefix` (optional): The prefix to be used for CloudFront access logs (default: "cloudfront-logs/")
- `price_class` (optional): The price class for CloudFront (default: "PriceClass_All").


Outputs:
- `cloudfront_domain_name`: The domain name of the CloudFront distribution.