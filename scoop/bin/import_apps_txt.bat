@echo off
pushd %~dp0
powershell -NoProfile -ExecutionPolicy Bypass -File "install-scoop.ps1"
popd
pause