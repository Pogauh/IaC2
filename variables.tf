variable "ec2_ami_id" {
  description = "AMI ID utilise pour LocalStack EC2."
  type        = string
  default     = "ami-03cf127a"
}

variable "bucket_name_prefix" {
  description = "Prefixe du bucket S3; un suffixe random est ajoute automatiquement."
  type        = string
  default     = "my-bucket"
}

