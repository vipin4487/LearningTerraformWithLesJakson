provider "azurerm" {
  features {  
  }
}

variable "imagebuild" {
  type        = string
  description = "Latest Image Build"
}

terraform {
  backend "azurerm" {
     resource_group_name = "tf_rg_blobstore"
     storage_account_name = "tfstoragevipinterraform"
     container_name = "tfstate"
     key = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "terraformmainrg" {
  name = "terraformmainrg"
  location = "East US"
}

resource "azurerm_container_group" "tfcg_test" {
  name                      = "weatherapi"
  location                  = azurerm_resource_group.terraformmainrg.location
  resource_group_name       = azurerm_resource_group.terraformmainrg.name

  ip_address_type     = "public"
  dns_name_label      = "vipinterraformwa"
  os_type             = "Linux"

  container {
      name            = "weatherapi"
      image           = "vipindocker1/myterraformwebapi:${var.imagebuild}"
        cpu             = "1"
        memory          = "1"

        ports {
            port        = 80
            protocol    = "TCP"
        }
  }
}

