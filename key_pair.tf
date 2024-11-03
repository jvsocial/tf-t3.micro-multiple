# key_pair.tf

# Generate a new private key
resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create a key pair in AWS
resource "aws_key_pair" "project_key" {
  key_name   = "cicd2" # Name for the key pair
  public_key = tls_private_key.my_key.public_key_openssh
}

# Store the private key in the current directory as a .pem file
resource "local_file" "private_key" {
  filename = "my-key.pem" # This will save the file in the current directory
  content  = tls_private_key.my_key.private_key_pem
}
# Output the private key for secure saving (optional)
output "private_key_pem" {
  description = "The private key for SSH access"
  value       = tls_private_key.my_key.private_key_pem
  sensitive   = true
}

# Output the key name for reference
output "key_name" {
  description = "The name of the created key pair"
  value       = aws_key_pair.project_key.key_name
}
