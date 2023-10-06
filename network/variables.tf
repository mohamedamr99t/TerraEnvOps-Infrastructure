variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}


variable "public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet"
  type        = list(string)
}

variable "private_subnet_cidr_block" {
  description = "The CIDR block for the private subnet"
  type        = list(string)
}

variable "availability_zones" {
  description = "A list of availability zones in the region"
  type        = list(string)
}
