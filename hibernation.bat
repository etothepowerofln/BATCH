@echo off

echo ****************************
echo ALERT! SYSTEM CONFIGURATION!
echo ****************************
echo This program will configure hibernation in your system.

:loop
set /p opt="Enable [e], disable [d], or disable and remove hiberfil.sys [r]? "

if /i "%opt%"=="r" (
powercfg -h off
) else if /i "%opt%"=="d" (
powercfg.exe /hibernate off
) else if /i "%opt%"=="e" (
powercfg.exe /hibernate on
) else (
echo Invalid operation.
goto loop
)