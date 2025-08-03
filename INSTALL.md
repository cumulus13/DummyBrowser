## Installation Options

### 🚀 Quick Install (Recommended)

**Option 1: Download Installer**
1. Go to [Releases](https://github.com/cumulus13/DummyBrowser/releases)
2. Download `LinkClipboardManager_Setup.exe`
3. Run as Administrator
4. Follow the installation wizard

**Option 2: Git Clone & Build**
```bash
# Clone repository
git clone https://github.com/cumulus13/DummyBrowser.git
cd DummyBrowser

# Build application
dotnet build -c Release

# Navigate to output
cd bin\Release\net6.0-windows\

# Run registry setup as Administrator
setup_registry.bat
```

**Option 3: Portable Version**
1. Download `LinkClipboardManager_Portable.zip` from [Releases](https://github.com/cumulus13/DummyBrowser/releases)
2. Extract to any folder
3. Run `setup_registry.bat` as Administrator

### 🔄 Auto-Updates

The application can check for updates automatically:
- Built-in update checker connects to GitHub API
- Notifications when new versions are available
- Direct link to download latest release
- Manual check via Start Menu → "Check for Updates"

### 📋 Quick Test

After installation:
1. Right-click any `.html` file
2. Choose "Open with" → "Choose another app"
3. Look for "Link Clipboard Manager"
4. Select it and test the clipboard functionality

## GitHub Integration

This project uses GitHub for:
- **Source Code**: Full source available for inspection
- **Issue Tracking**: Report bugs at `/issues`
- **Releases**: Automated builds via GitHub Actions
- **Updates**: API integration for update notifications