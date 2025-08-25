###########################################################
# AMI                                                     #
###########################################################

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["099720109477"] # Canonical
}

###########################################################
# JENKINS INSTANCE                                        #
###########################################################

# Create the EC2 instance and assign key pair
resource "aws_instance" "jenkins" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type2
  vpc_security_group_ids = [aws_security_group.allow_web.id]
  subnet_id              = aws_subnet.subnet.id
  key_name               = var.kp
  availability_zone      = var.az_1
  user_data              =file("Scripts/install_jenkins.sh")

  tags = {
    Name = "Jenkins-Server"
  }
}

###########################################################
# TOMCAT INSTANCE                                         #
###########################################################

data "template_file" "tomcat" {
  template = file("Scripts/install_tomcat.sh")

  vars = {
    script_user            = var.script_user
    script_password        = var.script_password
    gui_user               = var.gui_user
    gui_password           = var.gui_password
   
  }
}


resource "aws_instance" "tomcat" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_web.id]
  subnet_id              = aws_subnet.subnet.id
  key_name               = var.kp
  availability_zone      = var.az_1  
  user_data              = data.template_file.tomcat.rendered

  tags = {
    Name = "Tomcat-Server"
  }
}
