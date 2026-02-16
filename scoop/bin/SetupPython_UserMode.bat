@echo off
setlocal enabledelayedexpansion

:: -----------------------------------------------------------
:: SetupPython_UserMode.bat
:: 管理者権限なしでPython環境を構築するスクリプト
:: -----------------------------------------------------------

:: --- 設定 ---
set "BASE_DIR=C:\Database"
set "PY_DIR=%BASE_DIR%\python3124"
set "SRC_PY_DIR=%BASE_DIR%\src\python"

set "ZIP_URL=https://www.python.org/ftp/python/3.12.4/python-3.12.4-embed-amd64.zip"
set "PIP_URL=https://bootstrap.pypa.io/get-pip.py"
set "ZIP_PATH=%TEMP%\python312.zip"
set "GET_PIP_PATH=%PY_DIR%\get-pip.py"
set "HELLO_PY=%SRC_PY_DIR%\hello.py"

echo ===========================================================
echo   Python + pip + Structured Workspace Setup
echo ===========================================================
echo.

:: 1. フォルダ階層の作成
if not exist "%SRC_PY_DIR%" (
    echo [1/7] Creating workspace directory...
    mkdir "%SRC_PY_DIR%" 2>nul
    if errorlevel 1 (
        echo.
        echo ----------------------------------------------------------
        echo Error: Cannot create folder in C:\
        echo Please create 'C:\Database' manually, then run again.
        echo ----------------------------------------------------------
        pause & exit /b
    )
)
if not exist "%PY_DIR%" mkdir "%PY_DIR%"

:: 2. Python(zip)のダウンロード
echo [2/7] Downloading Python(zip)...
powershell -command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%ZIP_URL%' -OutFile '%ZIP_PATH%'"

:: 3. 展開
echo [3/7] Extracting Python...
powershell -command "Expand-Archive -Path '%ZIP_PATH%' -DestinationPath '%PY_DIR%' -Force"

:: 4. 環境変数の設定
echo [4/7] Optimizing Environment Variables...
for /f "tokens=2*" %%A in ('reg query HKCU\Environment /v Path 2^>nul') do set "OLD_PATH=%%B"
set "WAPPS=%%USERPROFILE%%\AppData\Local\Microsoft\WindowsApps"
set "CLEAN_PATH=%OLD_PATH:;%USERPROFILE%\AppData\Local\Microsoft\WindowsApps=%"
set "CLEAN_PATH=%CLEAN_PATH:%%USERPROFILE%%\AppData\Local\Microsoft\WindowsApps=%"
setx Path "%PY_DIR%;%PY_DIR%\Scripts;%CLEAN_PATH%;%WAPPS%"

:: 5. embed版の制約解除
echo [5/7] Updating _pth file...
(echo . & echo python312.zip & echo import site) > "%PY_DIR%\python312._pth"

:: 6. pipのインストール
echo [6/7] Installing pip...
powershell -command "Invoke-WebRequest -Uri '%PIP_URL%' -OutFile '%GET_PIP_PATH%'"
"%PY_DIR%\python.exe" "%GET_PIP_PATH%"
del "%GET_PIP_PATH%"

:: 7. hello.py の自動作成 (PowerShellを使用してUTF-8で保存)
echo [7/7] Creating hello.py in UTF-8...
set "PY_CODE=print(r'C:\Database から実行しています！ Hello Python!')"
powershell -command "$OutputEncoding = [System.Text.Encoding]::UTF8; Set-Content -Path '%HELLO_PY%' -Value \"!PY_CODE!\" -Encoding UTF8"

echo.
echo ===========================================================
echo   All Tasks Completed Successfully! (UTF-8 Mode)
echo ===========================================================
del "%ZIP_PATH%"

:: 新しいウィンドウで確認
start cmd /k "echo 【自動動作確認】 && echo. && echo ■1. Pythonバージョン: && python --version && echo. && echo ■2. pipバージョン: && pip -V && echo. && echo ■3. hello.py の実行テスト (UTF-8): && python "%HELLO_PY%" && echo. && echo ■4. 作業フォルダに移動しました。 && cd /d "%SRC_PY_DIR%""

echo This setup window can be closed.
pause
exit