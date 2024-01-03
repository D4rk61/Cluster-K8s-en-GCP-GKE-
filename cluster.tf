# Archivo de definicion del cluster de k8s en google cloud

resource "google_container_cluster" "k8s-cluster" {
  name        = var.cluster-name
  project     = var.project_id
  location    = var.k8s-location
  description = "Creacion de un Cluster con GKE"
  # enable_autopilot = true

  enable_legacy_abac       = true
  remove_default_node_pool = true
  initial_node_count       = var.initial_node_count
  network                  = google_compute_network.vpc-main.name
  subnetwork               = google_compute_subnetwork.subnet.name

  master_auth {

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "default" {
  name       = "${var.cluster-name}-node-pool"
  project    = var.project_id
  location   = var.k8s-location
  cluster    = google_container_cluster.k8s-cluster.name
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = var.machine_type
    disk_size_gb = 10
    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
