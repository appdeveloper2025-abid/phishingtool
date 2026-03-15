@echo off
title Educational Phishing Tool - ABID MEHMOOD (The White HAT Hacker)
color 0A

echo.
echo ╔══════════════════════════════════════════════════════════════════════════════╗
echo ║                    Educational Phishing Tool Launcher                       ║
echo ║                   Created by: ABID MEHMOOD (The White HAT Hacker)          ║
echo ╚══════════════════════════════════════════════════════════════════════════════╝
echo.

REM Check if Git Bash is available
where bash >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [*] Starting with Git Bash...
    bash phishing_tool.sh
) else (
    REM Check if WSL is available
    where wsl >nul 2>nul
    if %ERRORLEVEL% EQU 0 (
        echo [*] Starting with WSL...
        wsl bash phishing_tool.sh
    ) else (
        echo [!] Error: Bash environment not found!
        echo [*] Please install one of the following:
        echo     - Git for Windows (includes Git Bash)
        echo     - Windows Subsystem for Linux (WSL)
        echo.
        echo [*] Download Git for Windows: https://git-scm.com/download/win
        echo [*] Install WSL: wsl --install
        echo.
        pause
    )
)

pause