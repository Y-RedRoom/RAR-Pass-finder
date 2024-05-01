@echo off
title Rar Bypass - Y-RedRoom
mode 130,30
chcp 65001 >nul
echo.
echo.
echo               [31m      ██╗   ██╗     ██████╗ ███████╗██████╗ ██████╗  ██████╗  ██████╗ ███╗   ███╗  [0m
echo               [31m      ╚██╗ ██╔╝     ██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔═══██╗██╔═══██╗████╗ ████║  [0m
echo               [31m       ╚████╔╝█████╗██████╔╝█████╗  ██║  ██║██████╔╝██║   ██║██║   ██║██╔████╔██║  [0m
echo               [31m        ╚██╔╝ ╚════╝██╔══██╗██╔══╝  ██║  ██║██╔══██╗██║   ██║██║   ██║██║╚██╔╝██║  [0m
echo                [31m        ██║        ██║  ██║███████╗██████╔╝██║  ██║╚██████╔╝╚██████╔╝██║ ╚═╝ ██║  [0m
echo               [31m         ╚═╝        ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝     ╚═╝  [0m
echo.
echo.
if not exist "C:\Program Files\7-Zip" (
    echo 7-Zip not installed!
    pause
    exit
)

set /p archive="[34mEnter Archive: [0m"
if not exist "%archive%" (
    echo Archive not found!
    pause
    exit
)
echo.
set /p wordlist="[35mEnter Wordlist:[0m "
if not exist "%wordlist%" (
    echo Wordlist not found!
    pause
    exit
)

for /f %%a in (%wordlist%) do (
    set pass=%%a
    call :attempt
)
echo No valid password found in the wordlist. Try another wordlist.
pause
exit

:attempt
"C:\Program Files\7-Zip\7z.exe" x -p%pass% "%archive%" -o"cracked" -y >nul 2>&1
echo [32mCracking...[0m
if %errorlevel% EQU 0 (
    echo [91mPassword Found:[0m %pass%
    pause
    exit
)
