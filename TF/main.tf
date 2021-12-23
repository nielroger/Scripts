resource "aws_subnet" "subnet1" {
  provider          = aws.useast1
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  vpc_id            = aws_vpc.vpc1.id
  tags              = var.tags
}
resource "aws_subnet" "subnet2" {
  provider          = aws.useast1
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1b"
  vpc_id            = aws_vpc.vpc1.id
  tags              = var.tags
}
resource "aws_vpc" "vpc1" {
  provider         = aws.useast1
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags             = var.tags
}
output "output_subnet_id1" {
  value = aws_subnet.subnet1.id
}
output "output_subnet_id2" {
  value = aws_subnet.subnet2.id
}
output "output_vpc_id1" {
  value = aws_vpc.vpc1.id
}

