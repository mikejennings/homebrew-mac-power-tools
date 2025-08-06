# Homebrew Mac Power Tools

This is the official Homebrew tap for [Mac Power Tools](https://github.com/mikejennings/mac-power-tools), a powerful macOS system management CLI tool.

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
- **Power Management**: Sleep, restart, shutdown commands with safety prompts

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

## License

Mac Power Tools is licensed under the MIT License. See the [LICENSE](https://github.com/mikejennings/mac-power-tools/blob/master/LICENSE) file for details.

## Contributing

Contributions are welcome! Please submit pull requests to the [main repository](https://github.com/mikejennings/mac-power-tools).

---

**Homebrew Tap Maintained by**: Mike Jennings  
**Mac Power Tools Version**: 1.0.0