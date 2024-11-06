variable "vpc-id" {
  default = "192.168.40.0/24"

}

variable "pub-subnets" {
  default = {
    "public-subnet1" = {
      cidr_block       = "192.168.40.0/26"
      availablity_zone = "ap-south-1a"
      sub-name         = "Public Subnet1"
    }
    "public-subnet2" = {
      cidr_block       = "192.168.40.64/26"
      availablity_zone = "ap-south-1b"
      sub-name         = "Public Subnet2"
    }
  }

}

variable "pri-subnets" {
  default = {
    "private-subnet1" = {
      cidr_block       = "192.168.40.128/26"
      availablity_zone = "ap-south-1b"
      sub-name         = "Private Subnet1"

    }

    "private-subnet2" = {
      cidr_block       = "192.168.40.192/26"
      availablity_zone = "ap-south-1b"
      sub-name         = "Private Subnet2"

    }
  }
}