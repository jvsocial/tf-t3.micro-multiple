# main.tf in terraform-aws-free-tier-ec2 module

# Define the security group with the name "cicd_sg"
resource "aws_security_group" "cicd_sg" {
  name        = "cicd_sg" # Set the security group name
  description = "Security group for CI/CD instances"

  # Example ingress rule (update as needed)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH access from any IP (customize for security)
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  /* ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }*/

  ingress {
    from_port   = 81
    to_port     = 81
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Example egress rule (allows all outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instance resource
resource "aws_instance" "project_demo" {
  for_each        = toset(var.instance_names)
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.cicd_sg.name] # Attach the "cicd_sg" security group

  tags = {
    Name = each.key
  }
  user_data = var.user_data
}
