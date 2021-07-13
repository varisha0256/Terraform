module "ProjectDev" {

source = ".\modules\basic_infra"
aws_region="${var.aws_region}"
vpc_name="${var.vpc_name}"
vpc_cidr="${var.vpc_cidr}"
IGW_name="${var.IGW_name}"
Main_Routing_Table="${var.Main_Routing_Table}"
key_name="${var.key_name}"

}