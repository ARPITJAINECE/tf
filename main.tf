
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
  features {}
}

# Define input variables
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
  default     = "rg-first-aj-02"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account (must be globally unique)."
  default     = "mysa0101023"  # Ensure this is globally unique
}

variable "container_name" {
  type        = string
  description = "The name of the blob container for storing the state file."
  default     = "tfstate"
}

# Create the resource group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = "West US 2"
}

# Create the storage account
resource "azurerm_storage_account" "main" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  
  tags = {
    keyForStorageAccount = "valueForStorageAccount"
  }

  depends_on = [azurerm_resource_group.main]
}

# Create the blob container for storing the state file
resource "azurerm_storage_container" "main" {
  name                  = var.container_name
  storage_account_name   = azurerm_storage_account.main.name
  container_access_type   = "private"

  depends_on = [azurerm_storage_account.main]
}
