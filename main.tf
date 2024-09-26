terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.114.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "7ce53ffe-80a5-42a6-af05-890a8d744280"
  client_id       = "f63b7b95-2b3b-4767-abf2-239d7a7ba4c3"
  client_secret   = "mOg8Q~RDlQbXDsIOmh7gj2-pOfdMjYqTP_RNabvj"
  tenant_id       = "a8fa88d0-1b32-43dc-a2ce-09a8f7ac140f"
  features {

  }
}

variable "resource_group_name" {
  type        = string
  description = "Enter the Name of the RG : "
  default     = "rg-first"
}

resource "azurerm_resource_group" "terraformMadeRGIdentifier" {
  name     = var.resource_group_name
  location = "West US 2"
}
