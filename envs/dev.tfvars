environment          = "dev"
region              = "us-east-1"
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
instance_type       = "t3.micro"
ami_id              = "ami-091d7d61336a4c68f"
key_pair_name       = "your-keypair_here"  # Use you keypair name here