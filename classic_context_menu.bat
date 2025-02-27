@echo off

:loop
set /p "old=Set new [n] or old [o] context menu? "

if /i "%old%"=="o" (
echo You chose the OLD context menu.
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
if  errorlevel 1 goto eof
) else if /i "%old%"=="n" (
echo You chose the NEW context menu.
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
if  errorlevel 1 goto eof
) else (
echo Invalid option.
goto loop
)

taskkill /f /im explorer.exe
start explorer.exe
echo Done.

:eof
pause