terraform { 
			backend "local" {} 
			}

locals {
  standard_tags = {
    Component   = "user-service"
    Environment = "production"
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

variable "aws_access_key" {
}
variable "aws_secret_key" {
}
variable "aws_region" {
}
variable "mycloud_sg_name" {
  description = "Name of the security group"
  default = ""
}

variable "mycloud_vpcid" {
  description = "Name of the vpc used for security group"
  default     = "test"
}

variable "mycloud_ingress_service_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8200, 8201]
}

variable "sg_tags" {
  default = {"Name":"MyCloud_SG_Test","costCenter":"cost0001"}
}

resource "aws_security_group" "Mycloud-SG-Terraform" {
  name        = var.mycloud_sg_name
  description = "Mycloud-SG-Terraform-Test"
  vpc_id      = var.mycloud_vpcid

  dynamic "ingress" {
    iterator = port
    for_each = var.mycloud_ingress_service_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["10.7.12.0/22", "10.8.12.0/22", "10.9.12.0/22"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  

 tags =var.sg_tags

  

}
