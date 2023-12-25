# main.tf

terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

provider "virtualbox" {}

resource "null_resource" "example_vm" {
  provisioner "local-exec" {
    command = "vboxmanage createvm --name=my-terraform-vm --ostype=Ubuntu_64 --register"
  }

  provisioner "local-exec" {
    command = "vboxmanage modifyvm my-terraform-vm --memory 1024 --cpus 1"
  }
}