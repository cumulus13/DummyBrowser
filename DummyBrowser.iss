[Setup]
; Basic Information
AppId={{A7B8C9D0-E1F2-3456-7890-ABCDEF123456}
AppName=Link Clipboard Manager
AppVersion=0.11
AppPublisher=cumulus13
AppPublisherURL=https://github.com/cumulus13/DummyBrowser
AppSupportURL=https://github.com/cumulus13/DummyBrowser/issues
AppUpdatesURL=https://github.com/cumulus13/DummyBrowser/releases
DefaultDirName={autopf}\LinkClipboardManager
DefaultGroupName=Link Clipboard Manager
AllowNoIcons=yes
LicenseFile=LICENSE.txt
OutputDir=installer_output
OutputBaseFilename=LinkClipboardManager_Setup
; SetupIconFile=icon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
ArchitecturesInstallIn64BitMode=x64compatible

; Visual (comment out jika file tidak ada)
SetupIconFile=assets\setup_icon.ico
WizardImageFile=assets\wizard_image.bmp  
WizardSmallImageFile=assets\wizard_small.bmp

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
; Name: "indonesian"; MessagesFile: "compiler:Languages\Indonesian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 6.1
Name: "registerapp"; Description: "Register as browser alternative"; GroupDescription: "Browser Integration"; Flags: checkablealone

[Files]
; Main application files
Source: "bin\Release\net6.0-windows\DummyBrowser.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Release\net6.0-windows\DummyBrowser.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Release\net6.0-windows\DummyBrowser.runtimeconfig.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Release\net6.0-windows\DummyBrowser.deps.json"; DestDir: "{app}"; Flags: ignoreversion

; Configuration file
Source: "config.json"; DestDir: "{app}"; Flags: ignoreversion confirmoverwrite

; Documentation
Source: "README.md"; DestDir: "{app}"; Flags: ignoreversion
Source: "LICENSE.txt"; DestDir: "{app}"; Flags: ignoreversion

; Registry script for manual setup (backup)
Source: "setup_registry.bat"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\Link Clipboard Manager"; Filename: "{app}\DummyBrowser.exe"
Name: "{group}\Configuration"; Filename: "notepad.exe"; Parameters: """{app}\config.json"""
Name: "{group}\Check for Updates"; Filename: "https://github.com/cumulus13/DummyBrowser/releases"
Name: "{group}\Report Issues"; Filename: "https://github.com/cumulus13/DummyBrowser/issues"
Name: "{group}\{cm:UninstallProgram,Link Clipboard Manager}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\Link Clipboard Manager"; Filename: "{app}\DummyBrowser.exe"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Link Clipboard Manager"; Filename: "{app}\DummyBrowser.exe"; Tasks: quicklaunchicon

[Registry]
; Register application capabilities
Root: HKLM; Subkey: "SOFTWARE\RegisteredApplications"; ValueType: string; ValueName: "DummyBrowser"; ValueData: "Software\DummyBrowser\Capabilities"; Flags: uninsdeletevalue; Tasks: registerapp

; Application capabilities
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities"; ValueType: string; ValueName: "ApplicationName"; ValueData: "Link Clipboard Manager"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities"; ValueType: string; ValueName: "ApplicationDescription"; ValueData: "Copy links to clipboard instead of opening browser"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities"; ValueType: string; ValueName: "ApplicationIcon"; ValueData: "{app}\DummyBrowser.exe,0"; Flags: uninsdeletekey; Tasks: registerapp

; URL Associations
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities\URLAssociations"; ValueType: string; ValueName: "http"; ValueData: "DummyBrowser.HTTP"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities\URLAssociations"; ValueType: string; ValueName: "https"; ValueData: "DummyBrowser.HTTPS"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities\URLAssociations"; ValueType: string; ValueName: "ftp"; ValueData: "DummyBrowser.FTP"; Flags: uninsdeletekey; Tasks: registerapp

; File Associations
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities\FileAssociations"; ValueType: string; ValueName: ".html"; ValueData: "DummyBrowser.HTML"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities\FileAssociations"; ValueType: string; ValueName: ".htm"; ValueData: "DummyBrowser.HTM"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities\FileAssociations"; ValueType: string; ValueName: ".url"; ValueData: "DummyBrowser.URL"; Flags: uninsdeletekey; Tasks: registerapp

; Shell command for HTTP
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTTP"; ValueType: string; ValueName: ""; ValueData: "HTTP URL"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTTP\shell"; ValueType: string; ValueName: ""; ValueData: "open"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTTP\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\DummyBrowser.exe"" ""%1"""; Flags: uninsdeletekey; Tasks: registerapp

; Shell command for HTTPS
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTTPS"; ValueType: string; ValueName: ""; ValueData: "HTTPS URL"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTTPS\shell"; ValueType: string; ValueName: ""; ValueData: "open"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTTPS\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\DummyBrowser.exe"" ""%1"""; Flags: uninsdeletekey; Tasks: registerapp

; Shell command for FTP
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.FTP"; ValueType: string; ValueName: ""; ValueData: "FTP URL"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.FTP\shell"; ValueType: string; ValueName: ""; ValueData: "open"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.FTP\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\DummyBrowser.exe"" ""%1"""; Flags: uninsdeletekey; Tasks: registerapp

; Shell command for HTML files
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTML"; ValueType: string; ValueName: ""; ValueData: "HTML Document"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTML\shell"; ValueType: string; ValueName: ""; ValueData: "open"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTML\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\DummyBrowser.exe"" ""%1"""; Flags: uninsdeletekey; Tasks: registerapp

; Shell command for HTM files
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTM"; ValueType: string; ValueName: ""; ValueData: "HTML Document"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTM\shell"; ValueType: string; ValueName: ""; ValueData: "open"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTM\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\DummyBrowser.exe"" ""%1"""; Flags: uninsdeletekey; Tasks: registerapp

; Shell command for URL files
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.URL"; ValueType: string; ValueName: ""; ValueData: "Internet Shortcut"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.URL\shell"; ValueType: string; ValueName: ""; ValueData: "open"; Flags: uninsdeletekey; Tasks: registerapp
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.URL\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\DummyBrowser.exe"" ""%1"""; Flags: uninsdeletekey; Tasks: registerapp

[Run]
Filename: "{app}\DummyBrowser.exe"; Description: "{cm:LaunchProgram,Link Clipboard Manager}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: "{app}\*.log"
Type: files; Name: "{app}\*.tmp"

[Code]
procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    // Refresh shell icons after registry changes
    if WizardIsTaskSelected('registerapp') then
    begin
      // Notify Windows that file associations have changed
      RegWriteStringValue(HKEY_CURRENT_USER, 'Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\OpenWithProgids', 'DummyBrowser.HTML', '');
      RegWriteStringValue(HKEY_CURRENT_USER, 'Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.htm\OpenWithProgids', 'DummyBrowser.HTM', '');
      RegWriteStringValue(HKEY_CURRENT_USER, 'Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.url\OpenWithProgids', 'DummyBrowser.URL', '');
    end;
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  if CurUninstallStep = usPostUninstall then
  begin
    // Clean up user-specific registry entries
    RegDeleteKeyIncludingSubkeys(HKEY_CURRENT_USER, 'Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\OpenWithProgids');
    RegDeleteKeyIncludingSubkeys(HKEY_CURRENT_USER, 'Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.htm\OpenWithProgids');
    RegDeleteKeyIncludingSubkeys(HKEY_CURRENT_USER, 'Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.url\OpenWithProgids');
  end;
end;