# variables.tf
variable "aws_access_key" {
  description = "AWS access key for authentication"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key for authentication"
  type        = string
}

variable "aws_token" {
  description = "Session token for temporary access"
  type        = string
  default     = null
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-04b70fa74e45c3917"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}



variable "instance_names" {
  description = "Name of EC2 instance"
  type        = list(string)
  default     = ["vm1", "vm2", "vm3"]
}

variable "user_data" {
  description = "User data script to be run on instance launch"
  type        = string
  default     = "null"
}
