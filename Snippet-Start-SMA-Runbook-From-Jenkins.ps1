#requires -Version 1 -Modules Microsoft.SystemCenter.ServiceManagementAutomation
# Running 32 bit shell?
if ($pshome -like '*syswow64*') 
{
    Write-Warning -Message 'Restarting script under 64 bit powershell'

    # Relaunching this script in 64 bit shell
    # If you want powershell 2.0, add -version 2 *before* -file parameter
    & (Join-Path -Path ($pshome -replace 'syswow64', 'sysnative') -ChildPath powershell.exe) -file (Join-Path -Path $psscriptroot -ChildPath $myinvocation.mycommand) @args

    # exit 32 bit script
    exit
}

$securePassword = ConvertTo-SecureString -String $env:Password -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $env:UserName, $securePassword

Start-SmaRunbook -WebServiceEndpoint 'https://replaceme' -Port '9090' -RunbookName 'replaceme' -Parameters @{
    nodeName        = $env:nodeName
    nodeIPv4Address = $env:nodeIPv4Address
} -Credential $credential
