terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "terraform_state" {
  name     = "rg-terraform-state"
  location = "Central India"

  tags = {
    Project   = "Azure-Application-Infrastructure"
    ManagedBy = "Terraform"
    Purpose   = "Terraform State"
  }
}

resource "azurerm_storage_account" "terraform_state" {
  name                     = "tfstateazureapp202610"
  resource_group_name      = azurerm_resource_group.terraform_state.name
  location                 = azurerm_resource_group.terraform_state.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version = "TLS1_2"

  allow_nested_items_to_be_public = false

  shared_access_key_enabled = true

  tags = {
    Project   = "Azure-Application-Infrastructure"
    ManagedBy = "Terraform"
    Purpose   = "Terraform State"
  }
}

resource "azurerm_storage_container" "terraform_state" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.terraform_state.id
  container_access_type = "private"
}