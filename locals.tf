locals {
  common_tags = {
    Project = var.project
    Environment = var.env
    Terraform = "true"
  }

  vpc_final_tags = merge(
    local.common_tags, 
    { 
        Name = "${var.project}-${var.env}"
    },
    var.vpc_tags
    )

  igw_final_tags = merge(
    local.common_tags, 
    { 
        Name = "${var.project}-${var.env}-igw"
    },
    var.igw_tags
    ) 

   az_names = slice(data.aws_availability_zones.az_names.names,0,2)
}