@echo off
@chcp 65001

@cls
@SET "PER=%%%%" 
@SET "SITE=http://mirrors.kernel.org/sourceware/cygwin"
@SET "APP_PATH=%cd%" 
@SET "SRC=%APP_PATH%\src" 
@SET "APP=%APP_PATH%\app" 
@SET "TMP=%APP_PATH%\tmp" 
@SET "BIN=%APP%\bin" 
@SET "SHOTCUT_NAME=%USERPROFILE%\desktop\Zsh.url"

if exist "%windir%\fonts\MesloLGS NF Regular.ttf" goto continue

:info
@cls
echo.                                                       
ECHO ┌─── ℹ INFO ─────────────────────────────────────────┐
ECHO │                                                    │
ECHO │  BEFORE CONTINUE                                   │
ECHO │  YOU NEED INSTALL THE DEPENDENCIES                 │
ECHO │  FONTS MESLOLGS NF ON OPENNED FOLDER               │
ECHO │                                                    │
ECHO │                                       BY LUIS NT   │
ECHO └────────────────────────────────────────────────────┘
ECHO.                                                       
goto checkfonts

:warning
@cls
ECHO.
ECHO ┌─── ⚠ WARNING ──────────────────────────────────────┐
ECHO │                                                    │
ECHO │  ERROR: %DATE% %TIME:~0,8% - FONTS NOT FOUND      │
ECHO │                                                    │
ECHO ├────────────────────────────────────────────────────┤
ECHO │                                                    │
ECHO │  BEFORE CONTINUE                                   │
ECHO │  YOU NEED INSTALL THE DEPENDENCIES                 │
ECHO │  FONTS MESLOLGS NF ON OPENNED FOLDER               │
ECHO │                                                    │
ECHO │                                       BY LUIS NT   │
ECHO └────────────────────────────────────────────────────┘
ECHO.

:checkfonts
@start %SRC%\fonts\
pause

if not exist "%windir%\fonts\MesloLGS NF Regular.ttf" goto warning

:continue

@call %SRC%\dieZsh.cmd

if not exist "%APP%" @md %APP% > nul
if not exist "%BIN%" @md %BIN% > nul
if not exist "%TMP%" @md %TMP% > nul

@echo Copping files from %SRC% to %APP%
@copy %SRC%\zsh.ico %APP%\zsh.ico >nul
@copy %SRC%\dieZsh.bat %APP%\dieZsh.bat >nul
@copy %SRC%\setup-x86_64.exe %BIN%\setup-x86_64.exe >nul
@echo Copied fully - OK

echo.
@echo Extracting presseting of the "%SRC%\home\user.parts.rar" to "%APP%\home\%USERNAME%\"
@%SRC%\unrar x -va -inul -y "%SRC%\home\user.part01.rar" "%APP%\home\%USERNAME%\"
@echo Extracted fully - OK

echo.
@echo Download of the Zsh dependencies to %APP%
@%BIN%\setup-x86_64.exe -q --no-admin -n -N -l %TMP% -R %APP% -s %SITE%% -P zsh,bash,wget,lynx,git,chere >nul
@echo Downloaded fully - OK

echo.
@echo Creating Batch to open %APP%\Cygwin-integrated.bat
@echo @echo off>%APP%\Cygwin-integrated.bat
@echo set path = %BIN%;%PER:~1,1%PATH%PER:~1,1%>>%APP%\Cygwin-integrated.bat
@echo set CHERE_INVOKING=1>>%APP%\Cygwin-integrated.bat
@echo %BIN%\zsh.exe --login -i>>%APP%\Cygwin-integrated.bat
@echo Created fully - OK

@echo.
@echo Creating Batch to open Zsh %APP%\Cygwin.bat
@echo @echo off > %APP%\Cygwin.bat
@echo set path = %BIN%;%PER:~1,1%PATH%PER:~1,1% >> %APP%\Cygwin.bat
@echo @%APP%\dieZsh.bat >> %APP%\Cygwin.bat
@echo @cls >> %APP%\Cygwin.bat
@echo @setlocal enableextensions >> %APP%\Cygwin.bat
@echo @set TERM= >> %APP%\Cygwin.bat
@echo @%BIN%\mintty.exe -i /zsh.ico %BIN%\zsh --login >> %APP%\Cygwin.bat
@echo Created fully - OK

@echo.
@echo Creating Icon %SHOTCUT_NAME% 
@echo [InternetShortcut] > %SHOTCUT_NAME%
@echo URL="%APP%\Cygwin.bat" >> %SHOTCUT_NAME%
@echo IconFile=%APP%\zsh.ico >> %SHOTCUT_NAME%
@echo IconIndex=0 >> %SHOTCUT_NAME%
@echo Creation of the icon fully - OK

@echo.
@echo Open terminal from %SHOTCUT_NAME% 
@start %SHOTCUT_NAME%
@echo Openned fully - OK

@echo.
@echo ┌─── ℹ INFO ─────────────────────────┐
@echo │                                    │
@echo │  INSTALLATION COMPLETE.            │
@echo │  THANK YOU FOR USING OUR PRODUCT.  │
@echo │  YOU CAN NOW CLOSE THIS WINDOW.    │
@echo │                                    │
@echo │                        BY LUIS NT  │
@echo └────────────────────────────────────┘
@pause|more