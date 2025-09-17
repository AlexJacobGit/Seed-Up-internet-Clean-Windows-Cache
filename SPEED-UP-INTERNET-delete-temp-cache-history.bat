@echo off 
set DataDir=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles
del /q /s /f “%DataDir%”
rd /s /q “%DataDir%”
for /d %%x in (C:\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\*) do del /q /s /f %%x\*sqlite

ipconfig /flushdns

cleanmgr /sagerun:1

WSReset.exe

del /q/f/s %TEMP%\*

taskkill /f /im explorer.exe

del /f /s /q %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db

start explorer.exe

ipconfig /release

ipconfig /renew

ipconfig /flushdns

netsh winsock reset

netsh int tcp set global chimney=enabled

netsh int tcp set global autotuninglevel=normal

netsh int tcp set supplemental

netsh int tcp set global dca=enabled

netsh int tcp set global netdma=enabled

netsh int tcp set global ecncapability=enabled

netsh int tcp set global congestionprovider=ctc

netsh advfirewall firewall add rule name="StopThrottling" dir=in action=block remoteip=173.194.55.0/24,206.111.0.0/16 enable=yes

