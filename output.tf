output "instance_public_ips" {
  description = "The public IP addresses of the EC2 instances"
  value       = { for name, instance in aws_instance.project_demo : name => instance.public_ip }
}
