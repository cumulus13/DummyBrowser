@echo off
REM Registry setup untuk mendaftarkan dummy browser
REM Jalankan sebagai Administrator

set APP_NAME=DummyBrowser
set APP_PATH=%~dp0DummyBrowser.exe
set APP_DISPLAY_NAME=Link Clipboard Manager

echo Registering %APP_NAME% as browser application...
echo.

REM Copy config.json ke output directory jika belum ada
if not exist "%~dp0config.json" (
    echo Creating default config.json...
    echo { > "%~dp0config.json"
    echo   "ShowPrompt": true, >> "%~dp0config.json"
    echo   "AppName": "Link Clipboard Manager", >> "%~dp0config.json"
    echo   "ShowSuccessMessage": true >> "%~dp0config.json"
    echo } >> "%~dp0config.json"
)

REM Daftarkan aplikasi di registry
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\RegisteredApplications" /v "%APP_NAME%" /t REG_SZ /d "Software\%APP_NAME%\Capabilities" /f

REM Buat capabilities
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\%APP_NAME%\Capabilities" /v "ApplicationName" /t REG_SZ /d "%APP_DISPLAY_NAME%" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\%APP_NAME%\Capabilities" /v "ApplicationDescription" /t REG_SZ /d "Copy links to clipboard instead of opening browser" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\%APP_NAME%\Capabilities" /v "ApplicationIcon" /t REG_SZ /d "%APP_PATH%,0" /f

REM URL Associations
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\%APP_NAME%\Capabilities\URLAssociations" /v "http" /t REG_SZ /d "%APP_NAME%.HTTP" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\%APP_NAME%\Capabilities\URLAssociations" /v "https" /t REG_SZ /d "%APP_NAME%.HTTPS" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\%APP_NAME%\Capabilities\URLAssociations" /v "ftp" /t REG_SZ /d "%APP_NAME%.FTP" /f

REM File Associations  
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\%APP_NAME%\Capabilities\FileAssociations" /v ".html" /t REG_SZ /d "%APP_NAME%.HTML" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\%APP_NAME%\Capabilities\FileAssociations" /v ".htm" /t REG_SZ /d "%APP_NAME%.HTM" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\%APP_NAME%\Capabilities\FileAssociations" /v ".url" /t REG_SZ /d "%APP_NAME%.URL" /f

REM Shell command untuk HTTP
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\%APP_NAME%.HTTP" /ve /t REG_SZ /d "HTTP URL" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\%APP_NAME%.HTTP\shell" /ve /t REG_SZ /d "open" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\%APP_NAME%.HTTP\shell\open\command" /ve /t REG_SZ /d "\"%APP_PATH%\" \"%%1\"" /f

REM Shell command untuk HTTPS
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\%APP_NAME%.HTTPS" /ve /t REG_SZ /d "HTTPS URL" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\%APP_NAME%.HTTPS\shell" /ve /t REG_SZ /d "open" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\%APP_NAME%.HTTPS\shell\open\command" /ve /t REG_SZ /d "\"%APP_PATH%\" \"%%1\"" /f

REM Shell command untuk FTP
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\%APP_NAME%.FTP" /ve /t REG_SZ /d "FTP URL" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\%APP_NAME%.FTP\shell" /ve /t REG_SZ /d "open" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\%APP_NAME%.FTP\shell\open\command" /ve /t REG_SZ /d "\"%APP_PATH%\" \"%%1\"" /f

REM Shell command untuk HTML files
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\%APP_NAME%.HTML" /ve /t REG_SZ /d "HTML Document" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\%APP_NAME%.HTML\shell" /ve /t REG_SZ /d "open" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\%APP_NAME%.HTML\shell\open\command" /ve /t REG_SZ /d "\"%APP_PATH%\" \"%%1\"" /f

echo.
echo Registration complete!
echo Your application should now appear in "Open with" dialog.
echo.
pause