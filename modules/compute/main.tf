resource "aws_instance" "app" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_ids[0]
  key_name               = var.key_pair_name
  iam_instance_profile   = var.ec2_instance_profile_name
  vpc_security_group_ids = [var.web_sg_id]
  user_data              = file("${path.root}/user_data.sh")

  tags = {
    Name = "${var.environment}-app-ec2"
  }
}

resource "aws_eip" "bastion" {
  domain = "vpc"
}

resource "aws_instance" "bastion" {
  ami                    = var.ami_id
  instance_type          = "t3.micro"
  subnet_id              = var.public_subnet_ids[0]
  key_name               = var.key_pair_name
  vpc_security_group_ids = [var.web_sg_id]
  associate_public_ip_address = true

  tags = {
    Name = "${var.environment}-bastion"
  }
}

resource "aws_eip_association" "bastion_assoc" {
  instance_id   = aws_instance.bastion.id
  allocation_id = aws_eip.bastion.id
}

resource "aws_ebs_volume" "additional" {
  availability_zone = aws_instance.app.availability_zone
  size              = 10

  tags = {
    Name = "${var.environment}-additional-ebs"
  }
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.additional.id
  instance_id = aws_instance.app.id
}