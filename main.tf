

terraform {
  required_providers {
    aviatrix = {
      source = "aviatrixsystems/aviatrix"
    }
  }
  required_version = ">= 0.13"
}

# Configure Aviatrix provider
provider "aviatrix" {
  controller_ip           = "35.162.98.189"
  username                = "admin"
  password                = "Ccie16661!"
  
}




# Create an AWS VPC
resource "aviatrix_vpc" "AVFFSP16" {
  cloud_type           = 1
  account_name         = "Eskimoo"
  region               = "eu-central-1"
  name                 = "AVFFSP16"
  cidr                 = "10.77.16.0/20"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
}

# Create an AWS HUB VPC
resource "aviatrix_vpc" "AVFFHUB" {
  cloud_type           = 1
  account_name         = "Eskimoo"
  region               = "eu-central-1"
  name                 = "AVFFHUB"
  cidr                 = "10.77.0.0/20"
  aviatrix_transit_vpc = true
  aviatrix_firenet_vpc = false
}

# Create an Aviatrix AWS Gateway SP16
resource "aviatrix_gateway" "gw_for_sp16" {
  cloud_type   = 1
  account_name = "Eskimoo"
  gw_name      = "GWFFSP16"
  vpc_id       = "vpc-0f1867c3e96718043"
  vpc_reg      = "eu-central-1"
  gw_size      = "t2.micro"
  subnet       = "10.77.19.0/24"
  
  
}

# Create an Aviatrix AWS Transit Network Gateway
resource "aviatrix_transit_gateway" "gw_for_hub" {
  cloud_type               = 1
  account_name             = "Eskimoo"
  gw_name                  = "transit"
  vpc_id                   = "vpc-07496a4c111cbf324"
  vpc_reg                  = "eu-central-1"
  gw_size                  = "t2.micro"
  subnet                   = "10.77.0.80/28"
  ha_subnet                = "10.77.0.112/28"
  ha_gw_size               = "t2.micro"
  enable_active_mesh       = true
  enable_hybrid_connection = true
  connected_transit        = true
}