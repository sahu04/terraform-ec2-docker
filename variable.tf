variable "region" {
  default = "us-west-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "EC2 key pair name"
}

variable "instance_ami"{
default = "ami-0edea6d05015c16a4"
}