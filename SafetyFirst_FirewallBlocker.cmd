@echo off
setlocal EnableExtensions EnableDelayedExpansion

cd /d "%~dp0"

echo 🔒 Starting executable blocking process...
echo.

echo 🔄 Backing up current firewall rules...
netsh advfirewall export "%UserProfile%\Desktop\firewall-backup.wfw"
echo ✅ Firewall rules backed up to: %UserProfile%\Desktop\firewall-backup.wfw
echo.

echo 🚀 Scanning for executables and applying firewall blocks...

for /R %%F in (*.exe *.com *.scr *.bat) do (
    set "file=%%~fF"
    set "rulename=Block_%%~nxF_!random!"
    netsh advfirewall firewall add rule name="!rulename!-In"  dir=in  action=block program="!file!" profile=any >nul
    netsh advfirewall firewall add rule name="!rulename!-Out" dir=out action=block program="!file!" profile=any >nul
    echo 🔐 Blocked: !file!
)

echo.
echo ✅ Done. Executables in this folder are now blocked from internet access.
echo 🔁 You can restore the firewall using the backup file if needed.
pause
