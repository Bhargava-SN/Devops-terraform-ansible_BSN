terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-0f409bae3775dc8e5"
  instance_type = "t2.micro"
  key_name = "Bhargava_Key_Public"

  tags = {
    Name = "Bhargava-DevOps-batch-server"
    env = "Production"
    owner = "Bhargava SN"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

