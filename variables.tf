
variable "project_name" {
    type = "string"
    description = "Name of the project"
}

variable "project_id" {
    type = "string"
    description = "identifiant du projet"
}

variable "location" {
    type = "string"
    description = "emplacement de l'app engine chez google"
}



variable "version_id" {
    type = "string"
    description = "la version de l'api "
}


variable "service_name" {
    type = "list"
    description = "le nom des différents services "
}