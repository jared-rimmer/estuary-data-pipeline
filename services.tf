resource "google_project_service" "project" {
  project                    = var.project_id
  service                    = "bigquery.googleapis.com"
  disable_dependent_services = true

}
