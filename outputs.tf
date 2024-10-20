# outputs.tf
output "public_ip" {
  value = aws_instance.project_demo.public_ip
}

output "Message" {
  value = "It takes 5 mins to setup EC2 and get Jenkins ready for you, check on port 8080"
}

output "jenkins_url" {
  value       = "http://${aws_instance.project_demo.public_ip}:8080/login?from=%2F"
  description = "The URL to access Jenkins after setup"
}
