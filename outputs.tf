output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web.id
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "ssh_command" {
  description = "SSH command to connect to the instance"
  value       = "ssh -i deployer-key.pem ec2-user@${aws_instance.web.public_ip}"
}

output "bucket_id" {
  description = "ID of the S3 bucket"
  value       = aws_s3_bucket.demo_bucket.id
}

output "db_instance_id" {
  description = "ID of the database EC2 instance"
  value       = aws_instance.db.id
}

output "db_instance_public_ip" {
  description = "Public IP of the database EC2 instance"
  value       = aws_instance.db.public_ip
}
