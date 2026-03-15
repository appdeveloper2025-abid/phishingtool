# 🎯 Educational Phishing Tool - Complete Setup Guide

**Created by: ABID MEHMOOD (The White HAT Hacker)**

## 🚀 Quick Start (Windows Users)

### Method 1: Easy Windows Launch
1. **Double-click** `start_tool.bat` 
2. The tool will automatically detect and use Git Bash or WSL
3. Follow the beautiful menu interface

### Method 2: Python Web Server (Cross-Platform)
1. **Run**: `python web_server.py`
2. **Access**: http://localhost:8080
3. **Create templates** using the main script

## 🛠️ Complete Installation

### Windows Setup
```batch
# Option 1: Using Git Bash (Recommended)
1. Install Git for Windows: https://git-scm.com/download/win
2. Double-click start_tool.bat
3. Enjoy the beautiful interface!

# Option 2: Using WSL
1. Install WSL: wsl --install
2. Run: wsl bash phishing_tool.sh
```

### Linux/Mac Setup
```bash
# Make scripts executable
chmod +x *.sh

# Run the tool
./phishing_tool.sh
```

## 🎮 How to Use

### Step 1: Launch the Tool
- **Windows**: Double-click `start_tool.bat`
- **Linux/Mac**: Run `./phishing_tool.sh`

### Step 2: Beautiful Menu Interface
```
╔══════════════════════════════════════════════════════════════════════════════╗
║                              MAIN MENU                                      ║
╠══════════════════════════════════════════════════════════════════════════════╣
║  [1]  Facebook Login Page                                                   ║
║  [2]  Instagram Login Page                                                  ║
║  [3]  Twitter/X Login Page                                                  ║
║  ... (20+ more templates)                                                   ║
║  [26] Start Web Server                                                      ║
║  [99] Exit                                                                  ║
╚══════════════════════════════════════════════════════════════════════════════╝
```

### Step 3: Create Templates
1. **Select** a template number (1-24)
2. **Watch** as beautiful HTML pages are created
3. **Templates** are saved in the `templates/` folder

### Step 4: Start Web Server
1. **Select** option 26 to start the server
2. **Access** templates at http://localhost:8080
3. **View** the beautiful index page with all templates

### Step 5: Monitor Activity
1. **Select** option 25 to view captured data
2. **Select** option 28 to view server logs
3. **All data** is stored in organized folders

## 📁 File Structure After Setup

```
Phishing Tool/
├── 🚀 start_tool.bat           # Windows launcher
├── 🐍 web_server.py            # Python web server
├── 📜 phishing_tool.sh         # Main bash script
├── 🔧 template_creators.sh     # Template functions
├── ➕ additional_templates.sh  # More templates
├── 📖 README.md               # This guide
├── 📋 SETUP_GUIDE.md          # Setup instructions
├── 📁 templates/              # Generated templates
│   ├── 🏠 index.html         # Beautiful landing page
│   ├── 📘 facebook.html      # Facebook template
│   ├── 📧 gmail.html         # Gmail template
│   ├── 🔒 capture.php        # Data capture script
│   └── ... (more templates)
├── 📊 captured_data/          # Captured credentials
│   └── 📄 credentials.txt    # Login data
├── 📝 logs/                  # Server logs
│   ├── 📋 server.log         # HTTP logs
│   └── 🆔 server.pid         # Process ID
└── 🎨 assets/                # Resources
    ├── 🎨 css/
    ├── ⚡ js/
    └── 🖼️ images/
```

## 🎨 Features Showcase

### Beautiful ASCII Art Banner
```
    ██████╗ ██╗  ██╗██╗███████╗██╗  ██╗██╗███╗   ██╗ ██████╗
    ██╔══██╗██║  ██║██║██╔════╝██║  ██║██║████╗  ██║██╔════╝
    ██████╔╝███████║██║███████╗███████║██║██╔██╗ ██║██║  ███╗
    ██╔═══╝ ██╔══██║██║╚════██║██╔══██║██║██║╚██╗██║██║   ██║
    ██║     ██║  ██║██║███████║██║  ██║██║██║ ╚████║╚██████╔╝
```

### Color-Coded Interface
- 🔵 **Blue**: Information messages
- 🟢 **Green**: Success messages  
- 🟡 **Yellow**: Processing messages
- 🔴 **Red**: Error messages
- 🟣 **Purple**: Special highlights

### Professional Templates
- **Pixel-perfect** replicas of real login pages
- **Responsive** design for all devices
- **Modern CSS** styling
- **Authentic** appearance

## 🔧 Advanced Usage

### Custom Port Configuration
```bash
# Python server with custom port
python web_server.py 9090

# Access at http://localhost:9090
```

### Template Customization
1. **Edit** HTML files in `templates/` folder
2. **Modify** CSS styling
3. **Add** custom logos and branding
4. **Test** changes in browser

### Data Analysis
```bash
# View captured data
cat captured_data/credentials.txt

# Monitor server logs
tail -f logs/server.log
```

## 🛡️ Security & Ethics

### ✅ Authorized Uses
- **Penetration testing** with written permission
- **Security awareness** training
- **Educational** demonstrations
- **Research** purposes

### ❌ Prohibited Uses
- **Unauthorized** access attempts
- **Identity theft**
- **Financial fraud**
- **Malicious activities**

## 🐛 Troubleshooting

### Common Issues & Solutions

#### "Command not found" Error
```bash
# Windows: Install Git Bash or WSL
# Linux: Install bash shell
sudo apt-get install bash
```

#### "Port already in use" Error
```bash
# Find and kill process using port 8080
netstat -ano | findstr :8080
taskkill /PID <process_id> /F
```

#### Templates not loading
```bash
# Check if server is running
curl http://localhost:8080

# Verify templates directory exists
ls -la templates/
```

#### Permission denied
```bash
# Linux/Mac: Fix permissions
chmod +x *.sh

# Windows: Run as administrator
```

## 📊 Monitoring Dashboard

### Real-time Statistics
- **Templates created**: Tracked automatically
- **Server requests**: Logged with timestamps
- **Captured credentials**: Organized by service
- **IP addresses**: Tracked for analysis

### Log Format Example
```
================================================================================
CAPTURED DATA - 2024-01-15 14:30:25
IP Address: 192.168.1.100
User Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)...
----------------------------------------
email: user@example.com
password: userpassword123
service: Facebook
================================================================================
```

## 🎓 Educational Value

### Learning Objectives
1. **Understand** phishing attack vectors
2. **Recognize** suspicious login pages
3. **Implement** security awareness training
4. **Develop** defensive strategies

### Training Scenarios
- **Employee** security awareness
- **Student** cybersecurity education
- **Penetration testing** demonstrations
- **Red team** exercises

## 🤝 Support & Community

### Getting Help
- **Read** this comprehensive guide
- **Check** troubleshooting section
- **Review** error messages carefully
- **Test** in safe environments

### Best Practices
- **Always** get written authorization
- **Document** all testing activities
- **Inform** participants about training
- **Follow** responsible disclosure

## 🏆 Success Stories

### Educational Impact
- **Universities** using for cybersecurity courses
- **Companies** improving security awareness
- **Researchers** studying phishing techniques
- **Students** learning ethical hacking

## 📈 Future Enhancements

### Planned Features
- **More templates** for popular services
- **Advanced analytics** dashboard
- **Mobile-responsive** interface
- **Multi-language** support

## 👨💻 About the Creator

**ABID MEHMOOD (The White HAT Hacker)**
- 🛡️ **Cybersecurity Professional**
- 🎯 **Ethical Hacker**
- 🔍 **Security Researcher**
- 📚 **Educator**

### Mission Statement
*"Empowering cybersecurity education through hands-on learning and ethical hacking techniques."*

---

## 🎉 Ready to Start?

1. **Double-click** `start_tool.bat` (Windows)
2. **Run** `./phishing_tool.sh` (Linux/Mac)
3. **Enjoy** the beautiful interface!
4. **Learn** about cybersecurity!

**Remember: Use responsibly and ethically! 🛡️**

---

*Created with ❤️ by ABID MEHMOOD (The White HAT Hacker)*