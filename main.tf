provider "azurerm" {
  features {  
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
      image           = "vipindocker1/myterraformwebapi:latest"
        cpu             = "1"
        memory          = "1"

        ports {
            port        = 80
            protocol    = "TCP"
        }
  }
}

