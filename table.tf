resource "google_bigquery_table" "raw_data" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  project    = var.project_id
  table_id   = "raw_data"

  labels = {
    env = "estuary"
  }

  schema = <<EOF
[
  {
    "name": "id",
    "type": "INTEGER",
    "mode": "NULLABLE",
    "description": "ID of the product"
  },
  {
    "name": "product",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "The name of the product"
  },
  {
    "name": "quantity",
    "type": "INTEGER",
    "mode": "NULLABLE",
    "description": "The quantity of the product in stock"
  },
  {
    "name": "updated_at",
    "type": "TIMESTAMP",
    "mode": "NULLABLE",
    "description": "Timestamp of when the record was last updated"
  }
]
EOF

}
