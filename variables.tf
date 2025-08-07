variable "my_ip" {
  description = "My IP address"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Defines the region where AWS service is provisioned"
  type        = string
}

variable "az_1" {
  description = "Defines the availability zone where AWS service is provisioned"
  type        = string
}

variable "vpc" {
  description = "Defines the name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "Defines the CIDR block for VPC"
  type        = string
}

variable "subnet" {
  description = "Defines the name of the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "Defines the CIDR block for the subnet"
  type        = string
}

variable "igw" {
  description = "Defines the tag given to the internet gateway"
  type        = string
}

variable "route" {
  description = "Defines the tag given to the route table"
  type        = string
}

variable "sg" {
  description = "Defines the tag given to the security group"
  type        = string
}

variable "instance_type" {
  description = "Defines the instance type"
  type        = string
}

variable "kp" {
  description = "Defines the tag given to the key pair"
  type        = string
}

variable "script_user" {
  description = "Tomcat script username"
  type        = string
}

variable "script_password" {
  description = "tomcat script-user password"
  type        = string 
  sensitive   = true
}

variable "gui_user"{
  description = "tomcat gui username"
  type        = string
}

variable "gui_password" {
  description = "tomcat gui user password"
  type        = string
  sensitive   = true
}