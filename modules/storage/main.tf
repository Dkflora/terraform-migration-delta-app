resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "${var.environment}-delta-app-bucket-${random_string.bucket_suffix.result}"
  tags = {
    Name = "${var.environment}-s3"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.app_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "restrict_access" {
  bucket = aws_s3_bucket.app_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { AWS = var.ec2_role_arn }
        Action    = ["s3:GetObject", "s3:PutObject"]
        Resource  = "${aws_s3_bucket.app_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.environment}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.environment}-db-subnet-group"
  }
}

resource "aws_db_instance" "app_db" {
  allocated_storage     = 20
  storage_type          = "gp2"
  engine                = "mysql"
  engine_version        = "8.0"
  instance_class        = "db.t3.micro"
  db_name               = "deltaapp"
  username              = "admin"
  password              = "SecurePass123!"
  parameter_group_name  = "default.mysql8.0"
  vpc_security_group_ids = [var.db_sg_id]
  db_subnet_group_name  = aws_db_subnet_group.main.name
  publicly_accessible   = false
  skip_final_snapshot   = true

  tags = {
    Name = "${var.environment}-rds"
  }
}

resource "aws_dynamodb_table" "app_table" {
  name           = "${var.environment}-delta-app-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name = "${var.environment}-dynamodb"
  }
}