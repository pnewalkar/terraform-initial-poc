# Local VM deployment with Vagrant

The purpose of this repository is to standardise the deployment of a "virtual consultant kit" on your workstation.
Vagrant instantiates 2 VMs in VirtualBox that have an immutable private IP and use the USB devices (card reader, scale) plugged in the workstation.

## Instantiate 2 VMs (Pay and Weigh)

 - use the vagrant box image created by Packer
 - create a private network
 - start USB over IP client (VirtualHere) and connect the local VirtualHere server
 - install the demo/test application for the scale (Weigh) and card reader (Pay and Weigh)


## Prerequisites

 - [Oracle VirtualBox](https://www.virtualbox.org/) installed on your workstation
 - [Hashicorp Vagrant](https://www.vagrantup.com/docs/installation)
 - [VirtualHere usb over IP server](https://www.virtualhere.com/windows_server_software) you'll need to purchase a licence when you want to plug more than one USB device
 - a Vagrant box file created by the [packer code](../packer/README.md)

## Execution

```powershell
# From the location ./src/vagrant
# start the 2 VM using VirtualBox
vagrant up
# connect to the Pay VM
vagrant rdp pay
# connect to the Weigh VM
vagrant rdp weigh
# stop both vm (i.e. windows shutdown)
vagrant halt 
# remove both images from VirtualBox
vagrant destroy
```
