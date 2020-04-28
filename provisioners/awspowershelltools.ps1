
# Install AWS powershell features
Install-PackageProvider NuGet -Force;
Set-PSRepository PSGallery -InstallationPolicy Trusted
Install-Module AWSPowerShell -Confirm:$False -Force