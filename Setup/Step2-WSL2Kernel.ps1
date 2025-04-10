# Install WSL2 kernel update
$wslUpdateUrl = "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
$installerPath = "$env:TEMP\wsl_update_x64.msi"
Invoke-WebRequest -Uri $wslUpdateUrl -OutFile $installerPath
Start-Process msiexec.exe -Wait -ArgumentList "/i `"$installerPath`" /quiet"

# Set WSL 2 as default
wsl --set-default-version 2

Write-Host "✅ WSL 2 Kernel installed and set as default version." -ForegroundColor Green