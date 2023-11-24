$ErrorActionPreference= 'silentlycontinue'

$Cda8s_pw=(get-Content C:\Temp\Yid9-p.txt)

$Cda8s_cfg="YOUR CONFIGURATION TOKEN HERE"

if (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000)
    {
        Start-Process PowerShell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
        Exit;
    }
}

cd C:\Temp

Start-Process .\Cda8-s.exe --silent-install
Start-Sleep -seconds 10

$ServiceName = 'RustDesk'
$arrService = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue

if ($arrService -eq $null)
{
    Write-Output "Installing service"
    cd $env:ProgramFiles\RustDesk
    Start-Process .\rustdesk.exe --install-service -Verbose
    Start-Sleep -seconds 10
}

while ($arrService.Status -ne 'Running')
{
    Start-Service $ServiceName
    Start-Sleep -seconds 5
    $arrService.Refresh()
}

cd $env:ProgramFiles\RustDesk\
.\rustdesk.exe --get-id | Write-Output -OutVariable Cda8s_id

.\rustdesk.exe --config $Cda8s_cfg

.\rustdesk.exe --password $Cda8s_pw

New-Item C:\Temp\Cdi8-r.txt
$Cda8s_id | Out-File -FilePath C:\Temp\Cdi8-r.txt