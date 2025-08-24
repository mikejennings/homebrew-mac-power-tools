# Homebrew Mac Power Tools

This is the official Homebrew tap for [Mac Power Tools](https://github.com/mikejennings/mac-power-tools), a powerful macOS system management CLI tool.

## ⚠️ Disclaimer

**This is a personal project maintained in my spare time.** While I use Mac Power Tools daily and strive to make it reliable and useful, please note:

- **USE AT YOUR OWN RISK** - This software modifies system settings and files
- **NO WARRANTY** - Provided "as-is" without any warranty of any kind
- **PERSONAL PROJECT** - Not affiliated with Apple, Homebrew, or any other organization
- **BACKUP YOUR DATA** - Always maintain backups before using system management tools
- **TEST FIRST** - Consider testing commands in a safe environment before production use

By installing and using this software, you acknowledge that you understand these risks and accept full responsibility for any consequences.

## Installation

### Quick Install (Recommended)

```bash
brew tap mikejennings/mac-power-tools
brew install mac-power-tools
```

### One-line Install

```bash
brew install mikejennings/mac-power-tools/mac-power-tools
```

## Usage

After installation, you can use Mac Power Tools with the `mac` command:

```bash
mac help              # Show all available commands
mac update            # Update all system packages
mac info              # Show system information
mac maintenance       # Open maintenance menu
```

## Features

- **System Updates**: Update macOS, Homebrew, Mac App Store, npm, Ruby gems, and Python packages
- **System Information**: Monitor CPU, memory, disk, network, and battery status
- **Maintenance Tools**: Clean caches, empty trash, manage large files, DNS flush, and more
- **CleanMyMac Alternative**: Complete app uninstaller, duplicate finder, system cleaner, memory optimizer
- **App Migration**: Migrate Mac App Store and manually downloaded apps to Homebrew
- **Power Management**: Keep awake, sleep, restart, shutdown commands with safety features
- **Privacy & Security**: Security audit, browser data cleaner, exposed secrets scanner
- **Dotfiles Management**: iCloud sync for configuration files and app preferences
- **Downloads Management**: Automatic sorting and organization of Downloads folder

## Updating

To update Mac Power Tools:

```bash
brew update
brew upgrade mac-power-tools
```

## Uninstalling

To remove Mac Power Tools:

```bash
brew uninstall mac-power-tools
brew untap mikejennings/mac-power-tools
```

## Optional Dependencies

For full functionality, you may want to install:

```bash
brew install mas                    # For Mac App Store updates
brew install terminal-notifier      # For system notifications
```

## Support

- **Issues**: [GitHub Issues](https://github.com/mikejennings/mac-power-tools/issues)
- **Documentation**: [Mac Power Tools README](https://github.com/mikejennings/mac-power-tools#readme)
- **Source Code**: [GitHub Repository](https://github.com/mikejennings/mac-power-tools)

## License & Warranty

Mac Power Tools is licensed under the MIT License and is provided WITHOUT ANY WARRANTY. See the [LICENSE](https://github.com/mikejennings/mac-power-tools/blob/master/LICENSE) file for details.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED. Users assume all risks associated with its use.

## Contributing

Contributions are welcome! Please submit pull requests to the [main repository](https://github.com/mikejennings/mac-power-tools).

---

**Homebrew Tap Maintained by**: Mike Jennings  
**Mac Power Tools Version**: 4.0.3