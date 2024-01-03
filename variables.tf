variable "cluster-name" {
  default = "k8s-consiti"
}

variable "project_id" {

  # Nombre del proyecto en el que estamos trabajando
  default = "oceanic-cacao-409806"
}

variable "k8s-location" {
  default = "us-east1-b"
}

variable "vpc-location" {
  default = "us-east1"
}

variable "initial_node_count" {
  default = 2
}

variable "machine_type" {
  default = "n1-standard-1"
}