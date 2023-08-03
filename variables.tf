variable "region" {
  description = "The AWS region where the CloudFront distribution should be created."
  type        = string
}

variable "origin_domain" {
  description = "The domain name of the S3 bucket to be used as the CloudFront origin."
  type        = string
}

variable "origin_id" {
  description = "A unique identifier for the CloudFront origin."
  type        = string
}

variable "custom_ssl_certificate_arn" {
  description = "The ARN of the custom SSL certificate to be used (if any). Leave it empty for the default CloudFront certificate."
  type        = string
  default     = ""
}

variable "logging_bucket" {
  description = "The S3 bucket where CloudFront will store access logs."
  type        = string
}

variable "logging_prefix" {
  description = "The prefix to be used for CloudFront access logs."
  type        = string
  default     = ""
}

variable "price_class" {
  description = "The price class for CloudFront. Options: 'PriceClass_All', 'PriceClass_200', 'PriceClass_100'."
  type        = string
  default     = "PriceClass_All"
}
