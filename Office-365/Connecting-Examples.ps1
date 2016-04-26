# Defining Variables
$tenant = 'someTenant'
$UserCredential = Get-Credential

# Connect to Office 365
Connect-MsolService -Credential $UserCredential

# Connect to Sharepoint Online
Connect-SPOService -Url "https://$tenant-admin.sharepoint.com" -credential $UserCredential

# Connect to Microsoft Exchange Online
$excoSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $excoSession

# Connect to Microsoft Compliance Center
$ccSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $ccSession -Prefix cc

# Connect to Skype For Business Online
$sfboSession = New-CsOnlineSession -Credential $UserCredential
Import-PSSession $sfboSession

# Clean Up all sessions
Remove-PSSession $ccSession ; Remove-PSSession $sfboSession ; Remove-PSSession $excoSession ; Disconnect-SPOService
