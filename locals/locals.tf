locals {
    domain_name = "jagathlearn.art"
    zone_id = "Z05044682OYMGNDUWBHY0"
    instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
    #count.index will not work in locals -- so we cant use instance names
}


#here name is locals but while calling u need to call as local.zone_id etc etc

