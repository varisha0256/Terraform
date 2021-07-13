variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "azs" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "vpc_name" {}
variable "vpc_cidr" {}
#variable "public_subnet1_name" {}
#variable "public_subnet1_cidr" {}
variable "IGW_name" {}
variable "Main_Routing_Table" {}
variable "key_name" {}
variable "amis" {
  type = map(any)
  default = {
    us-east-2 = "ami-0277b52859bac6f4b" #amazonLinux
    us-east-1 = "ami-0ab4d1e9cf9a1215a" #amazonLinux
    us-west-1 = "ami-02f24ad9a1d24a799" #amazonLinux 
  }
}
variable "blocks" {
  type    = list(any)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
