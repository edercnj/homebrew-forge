# Generated with JReleaser 1.25.0 at 2026-10-30T04:30:00.49815386Z
#
# Fórmula multi-plataforma do tap edercnj/homebrew-forge (execution/37 §C2, ADR-0052).
# Gerada pelo JReleaser a partir de jreleaser.yml — NUNCA edite a fórmula renderizada
# no tap à mão; ajuste este template. Baseada no template native-image/brew do
# JReleaser. O ZIP traz launcher, native-image e corpus na raiz; a formula preserva o
# layout que o launcher espera depois da instalacao: bin/{forge,forge-native} + assets/.
class Forge < Formula
  desc "Local-first orchestration runtime for governed AI-assisted delivery"
  homepage "https://github.com/edercnj/forge"
  version "1.0.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/edercnj/forge/releases/download/v1.0.0/forge-1.0.0-linux-arm64.zip"
    sha256 "85e6b2c75af21068080611736edf4fce094b5bcaeab989a01512be02efaa46ec"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/edercnj/forge/releases/download/v1.0.0/forge-1.0.0-linux-x64.zip"
    sha256 "90b7f2fc662abc6c4ce03df13781cf8cc432545bb41fba6739a067522eeaeeac"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/edercnj/forge/releases/download/v1.0.0/forge-1.0.0-darwin-arm64.zip"
    sha256 "e0edb80ef9c6441c99d2d796a5f5a14f9dd4597eed4b4e49ade1d48378947109"
  end

  def install
    bin.install "forge", "forge-native"
    prefix.install "assets"
    prefix.install "manual"
  end

  test do
    system "#{bin}/forge", "--version"
    system "#{bin}/forge", "show", "manual", "--output", "json"
  end
end
