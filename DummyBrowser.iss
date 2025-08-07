; Link Clipboard Manager Installer Script
; Built with Inno Setup 6

#define MyAppName "Link Clipboard Manager"
#define MyAppVersion "1.0"
#define MyAppPublisher "cumulus13"
#define MyAppURL "https://github.com/cumulus13/DummyBrowser"
#define MyAppExeName "DummyBrowser.exe"
#define MyAppDescription "Copy links to clipboard instead of opening browser"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
AppId={{A8B5C2D1-E3F4-5A6B-7C8D-9E0F1A2B3C4D}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=LICENSE.txt
PrivilegesRequired=admin
PrivilegesRequiredOverridesAllowed=dialog
OutputDir=installer_output
OutputBaseFilename=LinkClipboardManager_Setup
SetupIconFile=assets\setup_icon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
DisableProgramGroupPage=yes
DisableReadyPage=no

; Modern wizard appearance (optional image files)
#ifdef WizardImageFile
WizardImageFile={#WizardImageFile}
#endif
#ifdef WizardSmallImageFile  
WizardSmallImageFile={#WizardSmallImageFile}
#endif

; Enable if image files exist
#ifexist "assets\wizard_image.bmp"
WizardImageFile=assets\wizard_image.bmp
#endif
#ifexist "assets\wizard_small.bmp"
WizardSmallImageFile=assets\wizard_small.bmp
#endif

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 6.1

[Files]
Source: "bin\Release\net7.0-windows\DummyBrowser.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Release\net7.0-windows\DummyBrowser.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Release\net7.0-windows\DummyBrowser.runtimeconfig.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Release\net7.0-windows\DummyBrowser.deps.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Release\net7.0-windows\*.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "config.json"; DestDir: "{app}"; Flags: ignoreversion confirmoverwrite
Source: "LICENSE.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "README.md"; DestDir: "{app}"; Flags: ignoreversion; Check: FileExists(ExpandConstant('{srcexe}\..\README.md'))

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Registry]
; Register as an application
Root: HKLM; Subkey: "SOFTWARE\RegisteredApplications"; ValueType: string; ValueName: "DummyBrowser"; ValueData: "Software\DummyBrowser\Capabilities"; Flags: uninsdeletevalue

; Application capabilities
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities"; ValueType: string; ValueName: "ApplicationName"; ValueData: "{#MyAppName}"; Flags: uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities"; ValueType: string; ValueName: "ApplicationDescription"; ValueData: "{#MyAppDescription}"; Flags: uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities"; ValueType: string; ValueName: "ApplicationIcon"; ValueData: "{app}\{#MyAppExeName},0"

; URL Associations
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities\URLAssociations"; ValueType: string; ValueName: "http"; ValueData: "DummyBrowser.HTTP"
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities\URLAssociations"; ValueType: string; ValueName: "https"; ValueData: "DummyBrowser.HTTPS"
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities\URLAssociations"; ValueType: string; ValueName: "ftp"; ValueData: "DummyBrowser.FTP"

; File Associations
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities\FileAssociations"; ValueType: string; ValueName: ".html"; ValueData: "DummyBrowser.HTML"
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities\FileAssociations"; ValueType: string; ValueName: ".htm"; ValueData: "DummyBrowser.HTM"
Root: HKLM; Subkey: "SOFTWARE\DummyBrowser\Capabilities\FileAssociations"; ValueType: string; ValueName: ".url"; ValueData: "DummyBrowser.URL"

; Protocol handlers
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTTP"; ValueType: string; ValueName: ""; ValueData: "HTTP URL"; Flags: uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTTP\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""

Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTTPS"; ValueType: string; ValueName: ""; ValueData: "HTTPS URL"; Flags: uninsdeletekey  
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTTPS\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""

Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.FTP"; ValueType: string; ValueName: ""; ValueData: "FTP URL"; Flags: uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.FTP\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""

Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTML"; ValueType: string; ValueName: ""; ValueData: "HTML Document"; Flags: uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTML\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""

Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTM"; ValueType: string; ValueName: ""; ValueData: "HTM Document"; Flags: uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.HTM\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""

Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.URL"; ValueType: string; ValueName: ""; ValueData: "Internet Shortcut"; Flags: uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Classes\DummyBrowser.URL\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Code]
function FileExists(FileName: string): Boolean;
begin
  Result := FileExists(FileName);
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    // Create default config.json if it doesn't exist
    if not FileExists(ExpandConstant('{app}\config.json')) then
    begin
      SaveStringToFile(ExpandConstant('{app}\config.json'),
        '{' + #13#10 +
        '  "ShowPrompt": true,' + #13#10 +
        '  "AppName": "Link Clipboard Manager",' + #13#10 +
        '  "ShowSuccessMessage": true' + #13#10 +
        '}', False);
    end;
  end;
end;