variable "environment" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "key_pair_name" {
  type = string
}

variable "ec2_instance_profile_name" {  # New: Name instead of ARN
  type = string
}

variable "web_sg_id" {
  type = string
}