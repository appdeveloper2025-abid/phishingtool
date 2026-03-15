# 🎯 Educational Phishing Tool

**Created by: ABID MEHMOOD (The White HAT Hacker)**

## ⚠️ DISCLAIMER

This tool is created for **EDUCATIONAL PURPOSES ONLY**. It is designed to help cybersecurity professionals, students, and organizations understand phishing techniques and improve their security awareness. 

**DO NOT USE THIS TOOL FOR MALICIOUS PURPOSES**

## 🚀 Features

- **Beautiful GUI Interface** with colorful menus and professional design
- **20+ Phishing Templates** including popular services
- **Real-time Data Capture** with detailed logging
- **Built-in Web Server** for easy deployment
- **Professional Templates** that look authentic
- **Educational Focus** with security awareness messages

## 📋 Included Templates

1. **Facebook** - Social media login page
2. **Instagram** - Photo sharing platform
3. **Twitter/X** - Microblogging platform
4. **LinkedIn** - Professional networking
5. **Gmail** - Google email service
6. **Yahoo Mail** - Yahoo email service
7. **Outlook** - Microsoft email service
8. **PayPal** - Payment platform
9. **Amazon** - E-commerce platform
10. **eBay** - Online marketplace
11. **Netflix** - Streaming service
12. **Spotify** - Music streaming
13. **Apple ID** - Apple services
14. **Microsoft** - Microsoft account
15. **GitHub** - Code repository
16. **Discord** - Gaming communication
17. **WhatsApp Web** - Messaging service
18. **Telegram Web** - Secure messaging
19. **Steam** - Gaming platform
20. **Dropbox** - Cloud storage
21. **Adobe** - Creative software
22. **Banking** - Generic banking portal
23. **WordPress** - Content management
24. **Custom Template Creator** - Build your own

## 🛠️ Installation & Setup

### Prerequisites

- Linux/macOS/Windows with WSL
- Bash shell
- Python 3.x
- Apache/HTTP server (auto-installed)
- PHP (auto-installed)

### Quick Start

1. **Clone or Download** the tool:
   ```bash
   git clone <repository-url>
   cd "Phishing Tool"
   ```

2. **Make executable**:
   ```bash
   chmod +x phishing_tool.sh
   chmod +x template_creators.sh
   chmod +x additional_templates.sh
   ```

3. **Run the tool**:
   ```bash
   ./phishing_tool.sh
   ```

## 🎮 Usage Instructions

### Main Menu Options

- **Options 1-24**: Create specific phishing templates
- **Option 25**: View captured credentials
- **Option 26**: Start web server (http://localhost:8080)
- **Option 27**: Stop web server
- **Option 28**: View server logs
- **Option 99**: Exit the tool

### Step-by-Step Usage

1. **Start the tool**: `./phishing_tool.sh`
2. **Select a template** (1-24) from the beautiful menu
3. **Start the web server** (Option 26)
4. **Access templates** at `http://localhost:8080/[template].html`
5. **View captured data** (Option 25) to see results
6. **Stop server** when done (Option 27)

## 📁 Directory Structure

```
Phishing Tool/
├── phishing_tool.sh          # Main script
├── template_creators.sh      # Template creation functions
├── additional_templates.sh   # Additional templates
├── templates/               # Generated HTML templates
│   ├── index.html          # Main landing page
│   ├── facebook.html       # Facebook template
│   ├── gmail.html          # Gmail template
│   ├── capture.php         # Data capture script
│   └── ...                 # Other templates
├── captured_data/          # Stored credentials
│   └── credentials.txt     # Captured login data
├── logs/                   # Server logs
│   ├── server.log         # HTTP server logs
│   └── server.pid         # Server process ID
└── assets/                # CSS, JS, images
    ├── css/
    ├── js/
    └── images/
```

## 🔧 Advanced Features

### Custom Template Creator
- Create your own phishing templates
- Customize target URLs
- Professional styling options

### Data Capture System
- Automatic credential logging
- IP address tracking
- User agent detection
- Timestamp recording

### Web Server Management
- Built-in Python HTTP server
- Process management
- Log monitoring
- Port configuration

## 🛡️ Security & Ethics

### Educational Use Only
- Authorized penetration testing
- Security awareness training
- Cybersecurity education
- Research purposes

### Prohibited Uses
- Unauthorized access attempts
- Identity theft
- Financial fraud
- Any malicious activities

### Best Practices
- Always get written permission
- Use in controlled environments
- Inform participants about training
- Follow responsible disclosure

## 🎨 Design Features

### Beautiful Interface
- Colorful ASCII art banner
- Professional menu system
- Color-coded status messages
- Progress indicators

### Authentic Templates
- Pixel-perfect replicas
- Responsive design
- Modern CSS styling
- Professional appearance

## 📊 Monitoring & Logging

### Captured Data Format
```
================================================================================
CAPTURED DATA - 2024-01-15 14:30:25
IP Address: 192.168.1.100
User Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)...
----------------------------------------
email: user@example.com
password: userpassword123
================================================================================
```

### Server Logs
- HTTP request logging
- Error tracking
- Access monitoring
- Performance metrics

## 🔍 Troubleshooting

### Common Issues

1. **Permission Denied**
   ```bash
   chmod +x *.sh
   ```

2. **Port Already in Use**
   - Stop existing servers
   - Use different port
   - Check running processes

3. **Templates Not Loading**
   - Verify web server is running
   - Check file permissions
   - Confirm template creation

### Debug Mode
- Check server logs: Option 28
- Verify file structure
- Test individual templates

## 🤝 Contributing

Contributions are welcome for educational improvements:
- New template designs
- Security enhancements
- Documentation updates
- Bug fixes

## 📜 License

This tool is provided for educational purposes under responsible use guidelines.

## 👨‍💻 Author

**ABID MEHMOOD (The White HAT Hacker)**
- Cybersecurity Professional
- Ethical Hacker
- Security Researcher

## 🙏 Acknowledgments

- Cybersecurity community
- Educational institutions
- Security researchers
- Open source contributors

---

**Remember: With great power comes great responsibility. Use this tool ethically and legally.**

## 📞 Support

For educational support and questions:
- Use for authorized testing only
- Follow responsible disclosure
- Respect privacy and laws
- Promote cybersecurity awareness

---

*"The best defense is understanding the attack"* - ABID MEHMOOD