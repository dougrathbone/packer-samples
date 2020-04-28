#Setup powershell module for WSU
Install-Module PSWindowsUpdate
Get-Command -module PSWindowsUpdate

#Add ourselves to the service manager
Add-WUServiceManager -ServiceID 7971f918-a847-4430-9279-4a52d1efe18d

#Install windows updates
Write-Output "Running Windows update..."
Get-WUInstall -MicrosoftUpdate -AcceptAll -IgnoreRebootRequired