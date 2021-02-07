param (
    $env
)

$here = Get-Location
$tfLocation = "$PSScriptRoot/../src/terraform/stacks/$env"

Set-Location $tfLocation
terraform init

terraform validate

terraform plan

Set-Location $here