
terraform {
  required_version = ">= 0.14"

  required_providers {
    # Cloud Run support was added on 3.3.0
    google = ">= 3.3"
  }
}

provider "google" {
#  credentials = file("file.json")
#  project     = "instructor-345716"
  region      = "us-central1"
}

resource "google_storage_bucket" "ukg_bucket" {
  name          = "custom_bucket_ukg"
  location      = "EU"
  force_destroy = true
  uniform_bucket_level_access = true

}
