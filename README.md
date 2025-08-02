# Dummy Browser - Link Clipboard Manager

A lightweight .NET console application that registers as a browser alternative in Windows, allowing users to copy links to clipboard instead of opening them in a web browser.

## Features

- 🔗 **Copy links to clipboard** instead of opening in browser
- ⚙️ **Configurable behavior** via JSON/TXT config file
- 🖥️ **Windows integration** - appears in "Open with" dialog
- 🚀 **Silent mode** - direct copy without confirmation prompt
- 📋 **Multiple protocol support** - HTTP, HTTPS, FTP
- 📄 **File association support** - HTML, HTM, URL files

## Installation

### Prerequisites
- .NET 6.0+ or .NET Framework 4.8
- Windows OS
- Administrator privileges (for registry setup)

### Build and Setup

1. **Clone or download the project**
```bash
git clone https://github.com/cumulus13/DummyBrowser
cd DummyBrowser
```

2. **Build the application**
```bash
dotnet build -c Release
```

3. **Navigate to output directory**
```bash
cd bin\Release\net6.0-windows\
```

4. **Copy configuration file**
```bash
copy ..\..\..\config.json .
```

5. **Run registry setup as Administrator**
```bash
setup_registry.bat
```

## Configuration

The application behavior can be customized using `config.json`:

```json
{
  "ShowPrompt": true,
  "AppName": "Link Clipboard Manager",
  "ShowSuccessMessage": true
}
```

### Configuration Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `ShowPrompt` | boolean | `true` | Show confirmation dialog before copying |
| `AppName` | string | `"Link Clipboard Manager"` | Application name displayed in dialogs |
| `ShowSuccessMessage` | boolean | `true` | Show success message after copying |

### Configuration Examples

**Silent Mode (Direct Copy):**
```json
{
  "ShowPrompt": false,
  "AppName": "Silent Link Copier",
  "ShowSuccessMessage": false
}
```

**Confirmation Mode:**
```json
{
  "ShowPrompt": true,
  "AppName": "Link Clipboard Manager",
  "ShowSuccessMessage": true
}
```

## Usage

1. **After installation**, the application will appear in Windows "Open with" dialog
2. **Right-click** on any HTML file, URL file, or web link
3. **Select "Open with"** → **"Choose another app"**
4. **Choose "Link Clipboard Manager"** from the list
5. **Depending on configuration**:
   - Confirmation dialog will appear (if `ShowPrompt: true`)
   - Link will be copied directly to clipboard (if `ShowPrompt: false`)

## Supported File Types & Protocols

### File Types
- `.html` - HTML documents
- `.htm` - HTML documents
- `.url` - Internet shortcuts

### Protocols
- `http://` - HTTP URLs
- `https://` - HTTPS URLs
- `ftp://` - FTP URLs

## Project Structure

```
DummyBrowser/
├── Program.cs              # Main application logic
├── DummyBrowser.csproj     # Project configuration
├── config.json             # Application configuration
├── setup_registry.bat      # Registry setup script
└── README.md              # This file
```

## How It Works

1. **Registry Integration**: The setup script registers the application as a browser alternative in Windows registry
2. **URL Handling**: Windows passes URLs as command-line arguments to the application
3. **Clipboard Operation**: The application copies the URL to system clipboard using Windows Forms
4. **User Feedback**: Optional confirmation dialogs and success messages based on configuration

## Registry Entries

The application creates the following registry entries:

- `HKEY_LOCAL_MACHINE\SOFTWARE\RegisteredApplications`
- `HKEY_LOCAL_MACHINE\SOFTWARE\DummyBrowser\Capabilities`
- `HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DummyBrowser.*`

## Uninstallation

To remove the application from "Open with" dialog:

1. Delete the registry entries created by the setup script
2. Or create an uninstall script with `reg delete` commands for all created keys

## Troubleshooting

### Build Issues
- Ensure you have .NET 6.0+ SDK installed
- For older systems, switch to .NET Framework 4.8 target
- Check that Windows Forms support is available

### Registry Issues
- Run `setup_registry.bat` as Administrator
- Verify the executable path in the batch script
- Check Windows Event Viewer for registry errors

### Clipboard Issues
- Ensure the application has permission to access clipboard
- Some antivirus software may block clipboard operations
- Try running as Administrator if clipboard access fails

## Development

### Building for Different Frameworks

**.NET 6.0+ (Recommended):**
```xml
<TargetFramework>net6.0-windows</TargetFramework>
<UseWindowsForms>true</UseWindowsForms>
```

**.NET Framework 4.8 (Legacy):**
```xml
<TargetFramework>net48</TargetFramework>
<UseWindowsForms>true</UseWindowsForms>
```

### Adding New Features

1. **New Protocols**: Add entries to `setup_registry.bat`
2. **Configuration Options**: Extend the `Config` class
3. **File Types**: Add new file associations in registry setup

## License

This project is provided as-is for educational and utility purposes.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly on Windows
5. Submit a pull request

## License

See [LICENSE](./LICENSE) for details.

## author
[Hadi Cahyadi](mailto:cumulus13@gmail.com)
    

[![Buy Me a Coffee](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/cumulus13)

[![Donate via Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/cumulus13)

[Support me on Patreon](https://www.patreon.com/cumulus13)