# get driver from FTDI

$driverUrl = "https://www.ftdichip.com/Drivers/CDM/CDM%20v2.12.28%20WHQL%20Certified.zip"

$output = "C:\tempDrivers\"
New-Item -ItemType Directory -Force -Path $output

$start_time = Get-Date

Invoke-WebRequest -Uri $driverUrl -OutFile "$output\ftdi-drivers.zip"
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
Expand-Archive -Path "$output\ftdi-drivers.zip" -DestinationPath "$output\ftdi-drivers"
Get-ChildItem "$output\ftdi-drivers" -Recurse -Filter "*.inf" | ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }