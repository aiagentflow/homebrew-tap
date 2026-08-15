class Aiscribe < Formula
  desc "Your AI's scribe. Every session, recorded, traceable, backed up"
  homepage "https://aiagentflow.dev/aiscribe"
  url "https://registry.npmjs.org/aiscribe/-/aiscribe-1.2.23.tgz"
  sha256 "e5aa8fdf72ab59fbdf00cd860dc73406de17fc45844357ef5f658ace3f242b32"
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
