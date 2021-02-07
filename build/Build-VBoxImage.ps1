param(
    $IsoMD5 = "7385435edbefc3dc78ab92909849790e",
    $IsoFile = "19042.631.201119-0144.20h2_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-gb.iso"
)
$here = Get-Location
$packerLocation = "$PSScriptRoot/../src/packer"

Set-Location $packerLocation

packer build -only=virtualbox-iso `
    -force `
    -var iso_path=$IsoFile `
    -var iso_md5=$IsoMD5 `
    packer.json

Set-Location $here
