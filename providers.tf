# Configuramos el provider de gcp

provider "google" {
  credentials = file("./oceanic-cacao-409806-a8b0f6c6e4f8.json")
  project     = var.project_id
}