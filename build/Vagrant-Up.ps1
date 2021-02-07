param (
)

$here = Get-Location
$vagrantLocation = "$PSScriptRoot/../src/vagrant"

Set-Location $vagrantLocation
vagrant up

Set-Location $here