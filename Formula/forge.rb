# Generated with JReleaser 1.25.0 at 2026-07-09T19:57:56.449861487Z
#
# Fórmula multi-plataforma do tap edercnj/homebrew-forge (execution/37 §C2, ADR-0052).
# Gerada pelo JReleaser a partir de jreleaser.yml — NUNCA edite a fórmula renderizada
# no tap à mão; ajuste este template. Baseada no template native-image/brew do
# JReleaser, customizada para: (a) o layout do nosso tarball/zip (executável `forge`
# na raiz, não `bin/forge`); (b) os caveats da Nerd Font.
#
# NÃO usar `depends_on cask:` — o Homebrew não permite que uma *formula* dependa de um
# *cask* (erro "Unsupported special dependency: :cask" no `brew install`). A Nerd Font
# é instruída nos caveats, não como dependência.
class Forge < Formula
  desc "Local-first orchestration runtime for governed AI-assisted delivery"
  homepage "https://github.com/edercnj/forge"
  version "0.2.2"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/edercnj/forge/releases/download/v0.2.2/forge-0.2.2-linux-arm64.zip"
    sha256 "6fb9dca410cec9ba8b79e4b9e1322f6529f953c9a5ba8eabaccbfcc800c6cdde"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/edercnj/forge/releases/download/v0.2.2/forge-0.2.2-linux-x64.zip"
    sha256 "44f670ed05ca00297aa62db32e5ffb71aa88a2b9f26b72b8f90022f00a148550"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/edercnj/forge/releases/download/v0.2.2/forge-0.2.2-darwin-arm64.zip"
    sha256 "bfad1cc9a68f5f554b4960596288ae79dcc4b81650ba962313000ffc55781936"
  end

  def install
    bin.install "forge"
  end

  def caveats
    <<~EOS
      A TUI do forge (forge tui) usa ícones Nerd Font. Um app de terminal não instala
      fontes; para os ícones renderizarem, instale uma Nerd Font (uma vez):
        brew install --cask font-symbols-only-nerd-font    # leve, só símbolos (via fallback)
      Para o visual pleno estilo OpenCode, use a Geist Mono completa e selecione-a no terminal:
        brew install --cask font-geist-mono-nerd-font
        iTerm2: Settings → Profiles → Text → Font → "GeistMono Nerd Font Mono"
    EOS
  end

  test do
    system "#{bin}/forge", "--version"
  end
end
