# Project Structure untuk Inno Setup

```
DummyBrowser/
├── bin/
│   └── Release/
│       └── net7.0-windows/
│           ├── DummyBrowser.exe
│           ├── DummyBrowser.dll
│           ├── DummyBrowser.runtimeconfig.json
│           └── DummyBrowser.deps.json
├── installer_output/           # Output installer akan ada disini
├── Program.cs
├── DummyBrowser.csproj
├── DummyBrowser.iss           # Inno Setup script
├── build_installer.bat        # Build script
├── config.json
├── README.md
├── INSTALL.md
├── LICENSE.txt               # Akan dibuat otomatis jika tidak ada
├── setup_registry.bat        # Backup manual registry setup
└── assets/ (optional)
    ├── setup_icon.ico        # Icon untuk installer
    ├── wizard_image.bmp      # Background image installer
    └── wizard_small.bmp      # Small wizard image
```