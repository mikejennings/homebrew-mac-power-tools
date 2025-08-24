class MacPowerTools < Formula
  desc "Powerful macOS system management CLI tool with plugin architecture"
  homepage "https://github.com/mikejennings/mac-power-tools"
  url "https://github.com/mikejennings/mac-power-tools/archive/refs/tags/v4.0.2.tar.gz"
  sha256 "cfc04c966f832ec7c71d7a11f945936ba07d04698c925786b5aac479d0727254"
  license "MIT"
  version "4.0.2"

  def install
    # Install the main executable
    bin.install "mac"
    
    # Install the mac-plugin executable if it exists
    if File.exist?("mac-plugin")
      bin.install "mac-plugin"
    end
    
    # Install lib directory for plugin system
    libexec.install "lib"
    
    # Install plugins directory
    libexec.install "plugins"
    
    # Install scripts directory (if it still exists for compatibility)
    if File.exist?("scripts")
      libexec.install "scripts"
    end
    
    # Install completions
    if File.exist?("completions")
      libexec.install "completions"
    end
    
    # Install completion installer
    if File.exist?("install-completions.sh")
      libexec.install "install-completions.sh"
    end
    
    # Update the scripts to use the correct paths
    inreplace bin/"mac" do |s|
      s.gsub! /^SCRIPT_DIR=.*$/, "SCRIPT_DIR=\"#{libexec}\""
      s.gsub! /^export MAC_POWER_TOOLS_HOME=.*$/, "export MAC_POWER_TOOLS_HOME=\"#{libexec}\""
      s.gsub! /^MAC_HOME_DIR=.*$/, "MAC_HOME_DIR=\"#{libexec}\""
    end
    
    # Make all scripts executable
    chmod 0755, bin/"mac"
    if File.exist?(bin/"mac-plugin")
      chmod 0755, bin/"mac-plugin"
    end
    
    # Make plugin scripts executable
    Dir["#{libexec}/plugins/available/*/main.sh"].each do |script|
      chmod 0755, script
    end
    
    # Make lib scripts executable
    Dir["#{libexec}/lib/*.sh"].each do |script|
      chmod 0755, script
    end
    
    # Install completions automatically
    if File.exist?("completions")
      # Install zsh completion
      zsh_completion.install "completions/_mac"
      
      # Install bash completion  
      bash_completion.install "completions/mac-completion.bash" => "mac"
    end
    
    # Install documentation
    doc.install "README.md"
    doc.install "LICENSE"
    doc.install "PLUGIN_SPECIFICATION.md" if File.exist?("PLUGIN_SPECIFICATION.md")
  end

  def caveats
    <<~EOS
      Mac Power Tools v4.0.0 has been installed!
      
      🎉 NEW: Plugin-based architecture for modular functionality
      
      Core Commands:
        mac help              Show all available commands
        mac plugin list       List all available plugins
        mac plugin enable     Enable a plugin
        mac plugin disable    Disable a plugin
        mac plugin install    Install a plugin from GitHub
        mac plugin update     Update plugins
      
      Popular Commands:
        mac update            Update all system packages
        mac info              Show system information
        mac maintenance       Open maintenance menu
        mac battery health    Check battery health and cycles
        mac uninstall         Complete app uninstaller
        mac duplicates        Find duplicate files
      
      Tab completion has been automatically installed for zsh and bash.
      Restart your terminal or run:
        # For zsh: compinit
        # For bash: source $(brew --prefix)/etc/profile.d/bash_completion.sh
      
      Optional dependencies for full functionality:
        mas                   For Mac App Store updates (brew install mas)
        terminal-notifier     For notifications (brew install terminal-notifier)
        bash-completion       For bash tab completion (brew install bash-completion)
        fzf                   For interactive command selection (brew install fzf)
      
      For more information:
        https://github.com/mikejennings/mac-power-tools
    EOS
  end

  test do
    # Test that the main command works
    assert_match "Mac Power Tools", shell_output("#{bin}/mac version")
    
    # Test help command
    assert_match "COMMANDS", shell_output("#{bin}/mac help")
    
    # Test plugin system
    assert_match "Available Plugins", shell_output("#{bin}/mac plugin list")
  end
end