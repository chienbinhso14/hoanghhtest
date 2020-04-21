if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
$Server = Read-Host -Prompt 'Input Servername'
set-executionpolicy Unrestricted -Force
Set-TimeZone -Name "SE Asia Standard Time"
$rdNum = Read-Host -Prompt 'Input RD last IP segment'
$ip = '192.168.102.' + $rdNum 
$ifNum = Get-NetAdapter | select -ExpandProperty ifIndex
Set-DnsClientServerAddress -InterfaceIndex $ifnum -ServerAddresses ("10.30.152.20","10.30.152.21")
New-NetIPAddress -InterfaceIndex $ifNum -IPAddress $ip -PrefixLength 24 -DefaultGateway 192.168.102.254
Get-ExecutionPolicy;
$w8 = Read-Host -Prompt 'Waiting...'
Rename-Computer -NewName $Server
$env:COMPUTERNAME
Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
Restart-Computer 