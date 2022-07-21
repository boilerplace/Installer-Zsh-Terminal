@echo off
@tasklist | find /i "gitstatusd-cygwin_nt-10.0-x86_64" && @taskkill /im gitstatusd-cygwin_nt-10.0-x86_64 /F>nul
@tasklist | find /i "setup-x86_64.exe" && @taskkill /im setup-x86_64.exe /F>nul
@tasklist | find /i "bash.exe" && @taskkill /im bash.exe /F>nul
@tasklist | find /i "zsh.exe" && @taskkill /im zsh.exe /F>nul
@cls
