# variables.tf
variable "aws_access_key" {
  description = "The AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "The AWS secret key"
  type        = string
}

variable "aws_token" {
  description = "The AWS session token"
  type        = string
  default     = null # Make it optional if you sometimes don't need a token
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1" # You can change the default as needed
}
