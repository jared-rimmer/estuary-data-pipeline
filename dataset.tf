resource "google_bigquery_dataset" "dataset" {
  dataset_id = "estuary_dataset"
  project    = var.project_id
  location   = "US"

  labels = {
    env = "estuary"
  }

  access {
    role          = "OWNER"
    user_by_email = google_service_account.estuary.email
  }

  access {
    role          = "OWNER"
    user_by_email = var.account_email
  }
}

resource "google_service_account" "estuary" {
  account_id = "estuary"
}

resource "google_bigquery_dataset_iam_member" "bigquery_admin" {
  project    = var.project_id
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  role       = "roles/bigquery.admin"
  member     = "serviceAccount:${google_service_account.estuary.email}"
}

resource "google_project_iam_member" "bigquery_job_user" {
  project = var.project_id
  role    = "roles/bigquery.jobUser"
  member  = "serviceAccount:${google_service_account.estuary.email}"
}
