variable "environment" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "db_sg_id" {
  type = string
}

variable "ec2_role_arn" {
  type = string
}