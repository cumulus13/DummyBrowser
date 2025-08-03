@echo off
echo Building Link Clipboard Manager Installer...
echo.

REM Check if Inno Setup is installed
if not exist "C:\Program Files (x86)\Inno Setup 6\ISCC.exe" (
    echo Error: Inno Setup 6 not found!
    echo Please install Inno Setup 6 from: https://jrsoftware.org/isinfo.php
    echo.
    pause
    exit /b 1
)

REM Build the .NET application first
echo Building .NET application...
dotnet build -c Release
if errorlevel 1 (
    echo Error: Failed to build .NET application
    pause
    exit /b 1
)

REM Create necessary directories
if not exist "installer_output" mkdir installer_output

REM Check if license file exists, create a simple one if not
if not exist "LICENSE.txt" (
    echo Creating default LICENSE.txt...
    echo MIT License > LICENSE.txt
    echo. >> LICENSE.txt
    echo Permission is hereby granted, free of charge, to any person obtaining a copy >> LICENSE.txt
    echo of this software and associated documentation files, to deal in the Software >> LICENSE.txt
    echo without restriction, including without limitation the rights to use, copy, >> LICENSE.txt
    echo modify, merge, publish, distribute, sublicense, and/or sell copies of the >> LICENSE.txt
    echo Software, and to permit persons to whom the Software is furnished to do so. >> LICENSE.txt
)

REM Build the installer
echo Building installer with Inno Setup...
"C:\Program Files (x86)\Inno Setup 6\ISCC.exe" DummyBrowser.iss

if errorlevel 1 (
    echo Error: Failed to build installer
    pause
    exit /b 1
)

echo.
echo Installer built successfully!
echo Output file: installer_output\LinkClipboardManager_Setup.exe
echo.

REM Ask if user wants to test the installer
set /p test="Do you want to test the installer? (y/n): "
if /i "%test%"=="y" (
    start "" "installer_output\LinkClipboardManager_Setup.exe"
)

pause