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
  client_id       = "7b5b0a33-29ab-489c-868b-8344bc5c99e2"
  client_secret   = "zl48Q~lx53_YeVUp~18hnKYzf0QtM3gBwRFhPc7Z"
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
