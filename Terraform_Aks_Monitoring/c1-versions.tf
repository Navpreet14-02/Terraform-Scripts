terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm={
      source = "hashicorp/azurerm"
      version = "3.104.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = ">=2.15.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.1"
    }
  }
}



provider "azurerm" {
  features {
  }
}

provider "azuread" {
  tenant_id = var.ad_tenant_id
}

resource "random_string" "random" {
  length = 5
  special = false
  lower = true
  upper = true
  numeric = true
}

