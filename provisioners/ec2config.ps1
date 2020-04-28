$EC2SettingsFile="C:\\ProgramData\\Amazon\\EC2-Windows\\Launch\\Sysprep\\unattend.xml"
$xml = [xml](Get-Content $EC2SettingsFile)
$xmlElement = $xml.get_DocumentElement()
$xmlElementToModify = $xmlElement.Plugins
$enableElements = "Ec2SetPassword", "Ec2SetComputerName", "Ec2HandleUserData", "Ec2DynamicBootVolumeSize"
$xmlElementToModify.Plugin | Where-Object {$enableElements -Contains $_.name} | Foreach-Object {$_.State="Enabled"}
$xml.Save($EC2SettingsFile)