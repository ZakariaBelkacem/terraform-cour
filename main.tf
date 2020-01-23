### Backend definition

# terraform {
#   # The configuration for this backend will be filled in by Terragrunt
#   backend "s3" {}
# }

#défini le projet dans gcloud
provider "google" {
  credentials = "${file("shareatsclef.json")}"
  project = "{{${var.project_id}}}"
  region  = "us-central1"
  zone    = "us-central1-c"
}
#gère la création d'un app engine
resource "google_app_engine_standard_app_version" "shareats" {
  #crée autant de service que de nom service
  count = "${length(var.service_name)}"
  project = "${var.project_id}"
  version_id = "${var.version_id}"
  service    = "${var.service_name[count.index]}"
  runtime    = "java8"

  project="${var.project_id}"
  #comment on lance l'application via le shell
  entrypoint {
    shell = "node ./app.js"
  }

  env_variables = {
    port = "8080"
  }

  noop_on_destroy = true
}
### Module Main

