variable "region" {
  type        = string
  description = "Region to execute the AWS provider and create VPC"
  nullable    = false
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones to provision subnets"
  nullable    = false

  validation {
    condition     = length(var.availability_zones) == 2
    error_message = "Specify exactly two availability zones in the region"
  }
}

variable "aws_user_id" {
  type        = string
  description = "AWS User ID"
  nullable    = false
}

variable "cluster_name" {
  type        = string
  description = "Cluster name"
}