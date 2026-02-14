variable "region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "eks_cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "db_engine_version" {
  description = "Aurora PostgreSQL engine version"
  type        = string
}

variable "db_instance_class" {
  description = "Instance class for RDS Aurora"
  type        = string
}

variable "db_master_username" {
  description = "Master username for the RDS cluster"
  type        = string
}
