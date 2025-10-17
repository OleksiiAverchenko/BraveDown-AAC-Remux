@echo off
pushd "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File ".\Repair-BraveDown.ps1"
echo.
echo Done. Press any key to close...
pause >nul
