# Formula template for the edercnj/homebrew-forge tap (execution/33 §Fase-4).
# Rendered by scripts/update-homebrew-tap.sh — placeholders are replaced with the
# release version and the per-platform tarball checksums. Never edit the rendered
# formula by hand in the tap; regenerate from this template.
class Forge < Formula
  desc "Local-first orchestration runtime for governed AI-assisted delivery"
  homepage "https://github.com/edercnj/forge"
  version "0.1.0"

  on_macos do
    # Apple Silicon only; Intel (x86_64) macOS is not supported yet.
    on_arm do
      url "https://github.com/edercnj/forge/releases/download/v0.1.0/forge-0.1.0-darwin-arm64.tar.gz"
      sha256 "a99ed2b8342e4b2c87a6e5ef119916ffd12f48f35c18d9d903bc7949b2aca053"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/edercnj/forge/releases/download/v0.1.0/forge-0.1.0-linux-arm64.tar.gz"
      sha256 "02e21e6a008181135bfbca95f405c5332de6ff0794ab9eb0c38fdd6a4cee0500"
    else
      url "https://github.com/edercnj/forge/releases/download/v0.1.0/forge-0.1.0-linux-x64.tar.gz"
      sha256 "53bc4d45ceb54b91b23adc25feb805e9d03c85e70bc10de5074e087bab443faf"
    end
  end

  def install
    bin.install "forge"
  end

  test do
    system "#{bin}/forge", "--version"
  end
end
