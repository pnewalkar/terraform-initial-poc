# get driver from ZoWeetek

$driverUrl = "https://zoweetek.cn/wp-content/uploads/2019/10/9540-V2-1.zip"

$output = "C:\tempDrivers\"
New-Item -ItemType Directory -Force -Path $output

$start_time = Get-Date

Invoke-WebRequest -Uri $driverUrl -OutFile "$output\zoweetek-drivers.zip"
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
Expand-Archive -Path "$output\zoweetek-drivers.zip" -DestinationPath "$output\smartcard-drivers"
Get-ChildItem "$output\smartcard-drivers" -Recurse -Filter "*.inf" | ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }
