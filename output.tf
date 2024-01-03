# output.tf

output "endpoint" {
  value = "Endpoint: ${google_container_cluster.k8s-cluster.endpoint}"
}

output "master_version" {
  value = google_container_cluster.k8s-cluster.master_version
}
