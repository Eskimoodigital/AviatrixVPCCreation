# Configure Aviatrix provider
provider "aviatrix" {
  controller_ip           = "1.2.3.4"
  username                = "admin"
  password                = "password"
  skip_version_validation = false
  version                 = "2.19.0"
}

# Create an AWS VPC
resource "aviatrix_vpc" "aws_vpc" {
  cloud_type           = 1
  account_name         = "devops"
  region               = "us-west-1"
  name                 = "aws-vpc"
  cidr                 = "10.0.0.0/16"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = false
}