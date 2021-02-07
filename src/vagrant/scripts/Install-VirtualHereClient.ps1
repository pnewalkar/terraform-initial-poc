# Download the VirtualHere exe

$clientUrl = "https://www.virtualhere.com/sites/default/files/usbclient/vhui64.exe"

$output = "C:\usbClient\"
New-Item -ItemType Directory -Force -Path $output
Write-Output "made directory"

$start_time = Get-Date

Invoke-WebRequest -Uri $clientUrl -OutFile "$output\vhui64.exe"
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"