output "cluster_endpoint" {
  description = "EKS Cluster Endpoint"
  value = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "EKS Cluster Name"
  value = module.eks.cluster_name
}

output "vpc_id" {
  description = "VPC id"
  value = module.vpc.vpc_id
}
