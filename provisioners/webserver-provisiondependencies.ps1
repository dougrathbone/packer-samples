# Download and install chocolatey
Write-Output "Installing Chocolatey."
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install webdeploy from chocolatey
Write-Output "Installing Webdeploy."
Invoke-Expression -Command: "choco install webdeploy -y"

# Install Git from chocolatey
Write-Output "Installing Git."
Invoke-Expression -Command: "choco install git.portable -y"

$distributablePath = "C:\windows\temp\vcredist_x64.exe"
Write-Output "Downloading c++ redistributable for SharpSVN to: $distributablePath"
Invoke-WebRequest -Uri "https://download.microsoft.com/download/A/8/0/A80747C3-41BD-45DF-B505-E9710D2744E0/vcredist_x64.exe" -OutFile $distributablePath -UseBasicParsing
Start-Process $distributablePath -ArgumentList "/q /norestart" -Wait  > $null

. "refreshenv"