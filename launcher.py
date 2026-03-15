#!/usr/bin/env python3
"""
Universal Educational Phishing Tool Launcher
Created by: ABID MEHMOOD (The White HAT Hacker)
Compatible with: Windows, Linux, macOS, Termux, Kali Linux
"""

import os
import sys
import platform
import subprocess
import shutil

def detect_platform():
    """Detect the current platform"""
    system = platform.system().lower()
    if 'android' in platform.platform().lower():
        return 'termux'
    elif system == 'linux':
        return 'linux'
    elif system == 'darwin':
        return 'macos'
    elif system == 'windows':
        return 'windows'
    else:
        return 'unknown'

def check_python():
    """Check if Python is available"""
    python_commands = ['python3', 'python', 'py']
    
    for cmd in python_commands:
        if shutil.which(cmd):
            try:
                result = subprocess.run([cmd, '--version'], capture_output=True, text=True)
                if result.returncode == 0:
                    return cmd
            except:
                continue
    return None

def check_bash():
    """Check if Bash is available"""
    return shutil.which('bash') is not None

def show_banner():
    """Show the tool banner"""
    print("\033[36m" + "="*80 + "\033[0m")
    print("\033[32m    Educational Phishing Tool - Universal Launcher\033[0m")
    print("\033[32m    Created by: ABID MEHMOOD (The White HAT Hacker)\033[0m")
    print("\033[36m" + "="*80 + "\033[0m")
    print()

def main():
    show_banner()
    
    platform_name = detect_platform()
    python_cmd = check_python()
    has_bash = check_bash()
    
    print(f"\033[33m[*] Detected Platform: {platform_name.title()}\033[0m")
    print(f"\033[33m[*] Python Available: {python_cmd if python_cmd else 'No'}\033[0m")
    print(f"\033[33m[*] Bash Available: {'Yes' if has_bash else 'No'}\033[0m")
    print()
    
    if not python_cmd:
        print("\033[31m[!] Python not found! Please install Python first.\033[0m")
        if platform_name == 'termux':
            print("\033[33m[*] Install with: pkg install python\033[0m")
        elif platform_name == 'linux':
            print("\033[33m[*] Install with: sudo apt-get install python3\033[0m")
        elif platform_name == 'windows':
            print("\033[33m[*] Download from: https://python.org/downloads/\033[0m")
        return
    
    print("\033[32m[+] Starting Educational Phishing Tool...\033[0m")
    print()
    
    # Try to run the appropriate version
    if has_bash and os.path.exists('phishing_tool.sh'):
        print("\033[33m[*] Running Bash version...\033[0m")
        try:
            subprocess.run(['bash', 'phishing_tool.sh'])
        except KeyboardInterrupt:
            print("\n\033[33m[*] Tool stopped by user\033[0m")
        except Exception as e:
            print(f"\033[31m[!] Error running bash version: {e}\033[0m")
            print("\033[33m[*] Falling back to Python version...\033[0m")
            run_python_version(python_cmd)
    else:
        print("\033[33m[*] Running Python version...\033[0m")
        run_python_version(python_cmd)

def run_python_version(python_cmd):
    """Run the Python version of the tool"""
    try:
        subprocess.run([python_cmd, 'web_server.py'])
    except KeyboardInterrupt:
        print("\n\033[33m[*] Tool stopped by user\033[0m")
    except Exception as e:
        print(f"\033[31m[!] Error running Python version: {e}\033[0m")

if __name__ == "__main__":
    main()