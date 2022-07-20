@echo off
@taskkill /IM gitstatusd-cygwin_nt-10.0-x86_64 /F>nul
@taskkill /IM setup-x86_64.exe /F>nul
@taskkill /IM bash.exe /F>nul
@taskkill /IM zsh.exe /F>nul
@cls
