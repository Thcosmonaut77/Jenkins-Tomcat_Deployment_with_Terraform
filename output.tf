output "Jenkins_server_url" {
  value       = "http://${aws_instance.jenkins.public_ip}:8080"
  description = "Jenkins"
}

output "Tomcat_server_url" {
  value       = "http://${aws_instance.tomcat.public_ip}:8080"
  description = "Tomcat"
}
