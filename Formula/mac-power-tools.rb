class MacPowerTools < Formula
  desc "Powerful macOS system management CLI tool"
  homepage "https://github.com/mikejennings/mac-power-tools"
  url "https://github.com/mikejennings/mac-power-tools/archive/refs/tags/v1.6.2.tar.gz"
  sha256 "afee67e45b3e0230ff7266e96b5f918a89635c06ab79d8dd01d4912644013759"
  license "MIT"
  version "1.6.2"

  def install
    # Install the main executable
    bin.install "mac"
    
    # Install scripts directory
    libexec.install "scripts"
    
    # Install completions
    if File.exist?("completions")
      libexec.install "completions"
    end
    
    # Install completion installer
    if File.exist?("install-completions.sh")
      libexec.install "install-completions.sh"
    end
    
    # Update the script to use the correct paths
    inreplace bin/"mac" do |s|
      s.gsub! /^SCRIPT_DIR=.*$/, "SCRIPT_DIR=\"#{libexec}\""
    end
    
    # Make all scripts executable
    chmod 0755, bin/"mac"
    Dir["#{libexec}/scripts/*.sh"].each do |script|
      chmod 0755, script
    end
    chmod 0755, "#{libexec}/install-completions.sh" if File.exist?("#{libexec}/install-completions.sh")
    
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
  end

  def caveats
    <<~EOS
      Mac Power Tools has been installed!
      
      Usage:
        mac help              Show all available commands
        mac update            Update all system packages
        mac info              Show system information
        mac maintenance       Open maintenance menu
      
      Tab completion has been automatically installed for zsh and bash.
      Restart your terminal or run:
        # For zsh: compinit
        # For bash: source $(brew --prefix)/etc/profile.d/bash_completion.sh
      
      Optional dependencies for full functionality:
        mas                   For Mac App Store updates (brew install mas)
        terminal-notifier     For notifications (brew install terminal-notifier)
        bash-completion       For bash tab completion (brew install bash-completion)
      
      For more information:
        https://github.com/mikejennings/mac-power-tools
    EOS
  end

  test do
    # Test that the main command works
    assert_match "Mac Power Tools", shell_output("#{bin}/mac version")
    
    # Test help command
    assert_match "COMMANDS", shell_output("#{bin}/mac help")
  end
end