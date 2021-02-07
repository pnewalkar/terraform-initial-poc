# Virtual Machine Image pipeline with Packer

The purpose of this repository is to standardise image creation that can be used either in a public cloud setting (Azure) or a private cloud run on a workstation (VirtualBox, Vagrant).
Packer instantiates a VM in the chosen provider, apply all necessary configuration steps (provisioners) and outputs an immutable image that can be used in the chosen cloud.

## Provisioning steps for a Slimming World tablet image

 - Change Windows update settings to use Slimming World WSUS
 - Install Puppet
 - Run puppet (masterless) with the latest of the Puppet code (from XpressWeigh.Tablets repository)


## Prerequisites

 - an account on Azure with full permission on at least 1 resource group
 - [Hashicorp Packer](https://learn.hashicorp.com/tutorials/packer/getting-started-install) installed on your workstation
 - [Oracle VirtualBox](https://www.virtualbox.org/) installed on your workstation
 - access to a Windows image, you can get one from the trial version or a MSDN subscription

## Execution

```powershell
# Build an Azure Image
# from the location ./src/packer
packer build -only=azure-arm `
    -force `
    packer.json
# Build a local vagrant.box file
# given a .iso file and its MD5 hash
$IsoMD5 = "xxxxxxxxxxxxxxxxxxx"
$IsoFile = "./path_to/the_image_file.iso"
packer build -only=virtualbox-iso `
    -force `
    -var iso_path=$IsoFile `
    -var iso_md5=$IsoMD5 `
    packer.json
```

