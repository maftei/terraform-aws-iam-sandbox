variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "bucket_name" {
  type = string
}

variable "iam_role_name" {
  type = string
}

variable "enable_versioning" {
  description = "Enable S3 bucket versioning"
  type        = bool
  default     = true
}

variable "user_name" {
  description = "The IAM username to create"
  type        = string
}
variable "tags" {
  type    = map(string)
  default = {}
}
