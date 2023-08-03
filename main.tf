provider "aws" {
  region = var.region
}

resource "aws_cloudfront_distribution" "static_site_distribution" {
  origin {
    domain_name = var.origin_domain
    origin_id   = var.origin_id
    custom_origin_config {
      http_port                = 80
      https_port               = 443
      origin_protocol_policy   = "http-only"
      origin_ssl_protocols     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
      origin_keepalive_timeout = 5
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.origin_id
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = var.custom_ssl_certificate_arn
    cloudfront_default_certificate = var.custom_ssl_certificate_arn == ""
    minimum_protocol_version       = "TLSv1.2_2019"
  }

  logging_config {
    include_cookies = false
    bucket          = var.logging_bucket
    prefix          = var.logging_prefix
  }

  price_class = var.price_class
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.static_site_distribution.domain_name
}
