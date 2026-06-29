#1. command line
# ex: terraform plan -var="instance_type=t3.large"

# 2. terraform.tfvars
# TF_VAR_your_variable_name
# create a file under varaibles like terraform.tfvars and place variables under it --> so it will ovveride default variables
 
# 3. environment variables
# ex: export TF_VAR_instance_type=t3.xlarge  --> if you dont given any command line or terraform.tfvars then it will take from environment variables

# 4. default

variable "ami_id" {
   type        = string 
   default     = "ami-0220d79f3f480ecf5"
   description = "This is the AMI ID of devops-practice which is RHEL-9"
        
}

variable "instance_type" {
   type        = string
   default     = "t3.micro"
}

variable "tags" {
    type    = map #optional
    default = {
        Name = "backend"
        Project = "expense"
        Component = "backend"
        Environment = "DEV"
        Terraform = "true"
    }
}

variable "sg_name" {
    default = "allow_sshh"
}

variable "sg_description" {
    default = "Allow port number 22 for ssh access"
}

variable "from_port" {
    default = 22
    type    = number
}

variable "to_port" {
    default = 22
    type    = number
}

variable "protocol" {
    default = "tcp"

}

variable "ingress_cidr" {
   type        = list(string)
   default     = ["0.0.0.0/0"]
}