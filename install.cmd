@echo off
@cls
@SET "PER=%%%%" 
@SET "SITE=http://mirrors.kernel.org/sourceware/cygwin"
@SET "APP_PATH=%cd%" 
@SET "SRC=%APP_PATH%\src" 
@SET "APP=%APP_PATH%\app" 
@SET "TMP=%APP_PATH%\tmp" 
@SET "BIN=%APP%\bin" 
@SET "SHOTCUT_NAME=%USERPROFILE%\desktop\Zsh.url"

@call %SRC%\dieZsh.cmd && @cls

@md %APP% > nul && @cls
@md %BIN% > nul && @cls
@md %TMP% > nul && @cls

@cls
@echo Making %APP%\Cygwin-integrated.bat
@echo @echo off>%APP%\Cygwin-integrated.bat
@echo set path = %BIN%;%PER:~1,1%PATH%PER:~1,1%>>%APP%\Cygwin-integrated.bat
@echo set CHERE_INVOKING=1>>%APP%\Cygwin-integrated.bat
@echo %BIN%\zsh.exe --login -i>>%APP%\Cygwin-integrated.bat
@echo Completed %APP%\Cygwin-integrated.bat
@echo Copping icon Terminal.ico to %APP%
@copy %SRC%\Terminal.ico %APP%\Terminal.ico >nul
@echo Copping utility of process dieZsh to %APP%
@copy %SRC%\dieZsh.bat %APP%\dieZsh.bat >nul
@echo Copping alias apt-get debian for apt to %BIN%
@copy %SRC%\apt %BIN%\apt >nul
@echo Copping alias cls for clear to %APP%
@copy %SRC%\cls %BIN%\cls >nul
@echo Copping installer Cygwin64 to %APP%
@copy %SRC%\setup-x86_64.exe %BIN%\setup-x86_64.exe >nul
@echo Download the dependencies zsh,bash,wget,git,chere to %APP%
@%BIN%\setup-x86_64.exe -q --no-admin -n -N -l %TMP% -R %APP% -s %SITE%% -P zsh,bash,wget,lynx,git,chere >nul
@echo Extracting the home/root to %APP%
@%SRC%\unrar x -v %SRC%\home\root.part01.rar %APP%\home\
@echo Call icon Cygwin64 Terminal to open Zsh shell
@echo.

@echo Creating Batch to open Zsh

@echo @echo off > %APP%\Cygwin.bat
@echo set path = %BIN%;%PER:~1,1%PATH%PER:~1,1% >> %APP%\Cygwin.bat
@echo @%APP%\dieZsh.bat >> %APP%\Cygwin.bat
@echo @cls >> %APP%\Cygwin.bat
@echo @setlocal enableextensions >> %APP%\Cygwin.bat
@echo @set TERM= >> %APP%\Cygwin.bat
@echo @%BIN%\mintty.exe -i /Terminal.ico %BIN%\zsh --login >> %APP%\Cygwin.bat

@echo Creating Icon %SHOTCUT_NAME% 

@echo [InternetShortcut] > %SHOTCUT_NAME%
@echo URL="%APP%\Cygwin.bat" >> %SHOTCUT_NAME%
@echo IconFile=%APP%\Terminal.ico >> %SHOTCUT_NAME%
@echo IconIndex=0 >> %SHOTCUT_NAME%

@%SHOTCUT_NAME%
