terraform {
  required_providers {
    bitbucket = {
      source  = "DrFaust92/bitbucket"
      version = "2.20.0"
    }
  }
}

provider "bitbucket" {
  username = var.bb_username
  password = var.bb_password
}

# Manage your repository
resource "bitbucket_repository" "infrastructure" {
  owner             = var.bb_workspace
  name              = "terraform-code"
  project_key       = "TERRAFORMPROJ"
  pipelines_enabled = "true"
}

# Manage your project
resource "bitbucket_project" "infrastructure" {
  owner = var.bb_workspace
  name  = "terraform-project"
  key   = "TERRAFORMPROJ"
}

resource "bitbucket_deployment" "dev" {
  repository = bitbucket_repository.infrastructure.id
  name       = "DEV"
  stage      = "Test"
}

resource "bitbucket_deployment_variable" "var1" {
  deployment = bitbucket_deployment.dev.id
  value      = "val1"
  key        = "key1"
  secured    = false
}

resource "bitbucket_deployment_variable" "var2" {
  deployment = bitbucket_deployment.dev.id
  value      = "val2"
  key        = "key2"
  secured    = false
}

resource "bitbucket_deployment_variable" "var3" {
  deployment = bitbucket_deployment.dev.id
  value      = "val3"
  key        = "key3"
  secured    = false
}