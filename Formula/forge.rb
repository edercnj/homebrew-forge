# Formula template for the edercnj/homebrew-forge tap (execution/33 §Fase-4).
# Rendered by scripts/update-homebrew-tap.sh — placeholders are replaced with the
# release version and the per-platform tarball checksums. Never edit the rendered
# formula by hand in the tap; regenerate from this template.
class Forge < Formula
  desc "Local-first orchestration runtime for governed AI-assisted delivery"
  homepage "https://github.com/edercnj/forge"
  version "0.1.1"

  on_macos do
    # Apple Silicon only; Intel (x86_64) macOS is not supported yet.
    on_arm do
      url "https://github.com/edercnj/forge/releases/download/v0.1.1/forge-0.1.1-darwin-arm64.tar.gz"
      sha256 "aa8b824f87eadcecfb2afae609e858d9b9af6eb0ecc7dfc1fd5668a55438079e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/edercnj/forge/releases/download/v0.1.1/forge-0.1.1-linux-arm64.tar.gz"
      sha256 "548184cdb2599b5bd65648bb550c041b2717710a2c21ff1148415740ba8aa54a"
    else
      url "https://github.com/edercnj/forge/releases/download/v0.1.1/forge-0.1.1-linux-x64.tar.gz"
      sha256 "b3a13fb7dc771212f7fc8d54aa292ffb7430f3a2bac974cd747a92d0aa8acb88"
    end
  end

  def install
    bin.install "forge"
  end

  test do
    system "#{bin}/forge", "--version"
  end
end
