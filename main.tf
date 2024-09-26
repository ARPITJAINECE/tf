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
  default     = "rg-first-aj-01"
}

# Set a default value for the storage account name
variable "storage_account_name" {
  type        = string
  description = "Enter the Name of The Storage Account : "
  default     = "mysamysamysaabccba"  # Replace with your desired default storage account name (must be globally unique)
}

resource "azurerm_storage_account" "terraformMadeStorageAccountIdentifier" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.terraformMadeRGIdentifier.name
  location                 = azurerm_resource_group.terraformMadeRGIdentifier.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  access_tier              = "Hot"

  tags = {
    keyForStorageAccount = "valueForStorageAccount"
  }

  depends_on = [azurerm_resource_group.terraformMadeRGIdentifier]
}
resource "azurerm_resource_group" "terraformMadeRGIdentifier" {
  name     = var.resource_group_name
  location = "West US 2"
}
