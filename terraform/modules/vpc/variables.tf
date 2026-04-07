variable "cluster_name" {
  description = "Cluster name"
  type        = string
}

variable "vpc_cidr" {
  description = "cidr for vpc"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "cidr for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "cidr for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "availabity zones"
  type        = list(string)
}
