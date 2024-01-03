
# VPC
resource "google_compute_network" "vpc-main" {
  name                    = "felsv-${var.project_id}-vpc-1"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "felsv-${var.project_id}-subnet-1"
  region        = var.vpc-location
  network       = google_compute_network.vpc-main.name
  ip_cidr_range = "10.10.0.0/24"
}