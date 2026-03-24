# Security group dedicated to the database server.
resource "aws_security_group" "db" {
  name        = "database-sg"
  description = "Allow DB and SSH traffic"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow MySQL traffic"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH traffic"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "database-sg"
  }
}

# EC2 instance dedicated to the database role.
resource "aws_instance" "db" {
  ami             = var.ec2_ami_id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.db.name]
  key_name        = aws_key_pair.deployer.key_name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install -y mariadb10.5
              EOF

  tags = {
    Name = "database-server"
    Role = "database"
  }
}

