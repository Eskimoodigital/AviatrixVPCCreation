



# Configure Aviatrix provider
provider "aviatrix" {
  controller_ip           = "35.162.98.189"
  username                = "admin"
  password                = "Ccie16661!"
  skip_version_validation = false
  version                 = "2.19.0"
}




# Create an AWS VPC
resource "aviatrix_vpc" "AVFFSP16" {
  cloud_type           = 1
  account_name         = "devops"
  region               = "eu-central-1"
  name                 = "AVFFSP16"
  cidr                 = "10.77.16.0/20"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
}
