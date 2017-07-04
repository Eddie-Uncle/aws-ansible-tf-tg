variable "region" {
  default = "us-east-1"
}

variable "newami" {
  description = "ami-XXXXXX"
}

variable "vpcid" {
  default = "vpc-d4eb24b2"
}

variable "azs" {
    default = "us-east-1a"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "keyname" {
    default = "devops"
}

variable "securitygroups" {
    default = [ "Dev" ]
}

variable "subnets" {
    default = "subnet-42235a0b"
}

provider "aws" {
    region  = "${var.region}"
}

resource "aws_instance" "test-terraform" {
  ami            	= "${var.newami}"
  instance_type  	= "${var.instance_type}"
  key_name	 	= "${var.keyname}"
  security_groups 	= "${var.securitygroups}"
  availability_zone	= "${var.azs}"
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}
