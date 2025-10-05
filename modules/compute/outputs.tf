output "ec2_instance_id" {
  value = aws_instance.app.id
}

output "bastion_public_ip" {
  value = aws_eip.bastion.public_ip
}