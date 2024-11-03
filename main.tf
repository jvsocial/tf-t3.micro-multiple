# main.tf in terraform-aws-free-tier-ec2 module

resource "aws_instance" "project_demo" {
  for_each      = toset(var.instance_names) # Convert list to a set to ensure unique keys
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = each.key.instance_names
  }


}
