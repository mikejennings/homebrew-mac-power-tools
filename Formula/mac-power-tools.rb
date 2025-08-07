class MacPowerTools < Formula
  desc "Powerful macOS system management CLI tool"
  homepage "https://github.com/mikejennings/mac-power-tools"
  url "https://github.com/mikejennings/mac-power-tools/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "efd746e9497108203727301d47eee83c03519e9452072f7ece66623443fec9bd"
  license "MIT"
  version "1.4.0"

  def install
    # Install the main executable
    bin.install "mac"
    
    # Install scripts directory
    libexec.install "scripts"
    
    # Update the script to use the correct paths
    inreplace bin/"mac" do |s|
      s.gsub! /^SCRIPT_DIR=.*$/, "SCRIPT_DIR=\"#{libexec}\""
    end
    
    # Make all scripts executable
    chmod 0755, bin/"mac"
    Dir["#{libexec}/scripts/*.sh"].each do |script|
      chmod 0755, script
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
      
      Optional dependencies for full functionality:
        mas                   For Mac App Store updates (brew install mas)
        terminal-notifier     For notifications (brew install terminal-notifier)
      
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