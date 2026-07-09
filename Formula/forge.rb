# Generated with JReleaser 1.25.0 at 2026-07-09T19:34:13.820223808Z
#
# Fórmula multi-plataforma do tap edercnj/homebrew-forge (execution/37 §C2, ADR-0052).
# Gerada pelo JReleaser a partir de jreleaser.yml — NUNCA edite a fórmula renderizada
# no tap à mão; ajuste este template. Baseada no template native-image/brew do
# JReleaser, customizada para: (a) o layout do nosso tarball/zip (executável `forge`
# na raiz, não `bin/forge`); (b) a dependência da Nerd Font; (c) os caveats.
class Forge < Formula
  desc "Local-first orchestration runtime for governed AI-assisted delivery"
  homepage "https://github.com/edercnj/forge"
  version "0.2.1"

  # A TUI (forge tui) usa ícones Nerd Font; um app de terminal não seta a própria fonte, então
  # instalamos uma Nerd Font (leve, só símbolos) e o fallback do sistema rende os ícones.
  depends_on cask: "font-symbols-only-nerd-font"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/edercnj/forge/releases/download/v0.2.1/forge-0.2.1-linux-arm64.zip"
    sha256 "9741807caef46b864cafb5c194cf64f55419390b4d3be7415ab91ee43b95fb80"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/edercnj/forge/releases/download/v0.2.1/forge-0.2.1-linux-x64.zip"
    sha256 "c1221fc61210bbcd5ac92513e50125eb99d6f23b6909687791a2ac145f0122de"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/edercnj/forge/releases/download/v0.2.1/forge-0.2.1-darwin-arm64.zip"
    sha256 "72ec2a0cceb7fc703cd0cf2c983205cb007421dd8dab370a6af67ee9c656acba"
  end

  def install
    bin.install "forge"
  end

  def caveats
    <<~EOS
      A TUI do forge usa ícones Nerd Font. Foi instalada a "Symbols Only Nerd Font"
      (os ícones aparecem via fallback do sistema). Para o visual pleno estilo OpenCode,
      instale e selecione a Geist Mono no seu terminal:
        brew install --cask font-geist-mono-nerd-font
        iTerm2: Settings → Profiles → Text → Font → "GeistMono Nerd Font Mono"
    EOS
  end

  test do
    system "#{bin}/forge", "--version"
  end
end
