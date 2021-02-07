param(
)
$here = Get-Location
$packerLocation = "$PSScriptRoot/../src/packer"

$loggedIn = $(az account show)
if (!$loggedIn) {
    az login
}
az account set --subscription 'IT Enterprise Dev/Test'

Set-Location $packerLocation

packer build -only=azure-arm `
    -force `
    packer.json

Set-Location $here