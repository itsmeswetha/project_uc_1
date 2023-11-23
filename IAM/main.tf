

resource "google_service_account" "my_service_account" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
}

resource "google_service_account_iam_binding" "role1" {
  service_account_id = google_service_account.my_service_account.name
  role               = var.role1

  members = [
    "serviceAccount:${google_service_account.my_service_account.email}"
  ]
}
resource "google_service_account_iam_binding" "role2" {
  service_account_id = google_service_account.my_service_account.name
  role               = var.role2

  members = [
    "serviceAccount:${google_service_account.my_service_account.email}"
  ]
}
resource "google_service_account_iam_binding" "role3" {
  service_account_id = google_service_account.my_service_account.name
  role               = var.role3

  members = [
    "serviceAccount:${google_service_account.my_service_account.email}"
  ]
}
resource "google_service_account_iam_binding" "role4" {
  service_account_id = google_service_account.my_service_account.name
  role               = var.role4

  members = [
    "serviceAccount:${google_service_account.my_service_account.email}"
  ]
}
/*resource "google_service_account_iam_binding" "role5" {
  service_account_id = google_service_account.sa.name
  role               = "roles/compute.networkAdmin"

  members = [
   "serviceAccount:${google_service_account.my_service_account.email}"
  ]
}*/