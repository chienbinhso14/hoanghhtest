set-executionpolicy Unrestricted -Force
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
Get-ExecutionPolicy;
$w8 = Read-Host -Prompt 'Waiting...'
Install-WindowsFeature RDS-RD-Server -IncludeManagementTools
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'LicensingMode' -value 4
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'LicenseServers' -value "192.168.102.30"
Add-Computer -DomainName cyberspace.vn  -Credential cyberspace\hoanghh -Restart 
Get-WmiObject Win32_ComputerSystem
Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');