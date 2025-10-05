output "vpc_id" {
  value = module.network.vpc_id
}

output "alb_dns_name" {
  value = module.loadbalancer.alb_dns_name
}

output "ec2_instance_id" {
  value = module.compute.ec2_instance_id
}

output "s3_bucket_name" {
  value = module.storage.s3_bucket_name
}

output "rds_endpoint" {
  value = module.storage.rds_endpoint
}

output "bastion_public_ip" {
  value = module.compute.bastion_public_ip
}