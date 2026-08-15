class Aiscribe < Formula
  desc "Your AI's scribe. Every session, recorded, traceable, backed up"
  homepage "https://aiagentflow.dev/aiscribe"
  url "https://registry.npmjs.org/aiscribe/-/aiscribe-1.3.0.tgz"
  sha256 "87e4ec58a4a6239062333222daa735838c64ca05d91aee03350b2de3817f02ad"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"dist/index.js" => "aiscribe"
  end

  test do
    assert_match "aiscribe v", shell_output("#{bin}/aiscribe --version")
  end
end
