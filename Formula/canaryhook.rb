class Canaryhook < Formula
  desc "Honeyfiles and canary tokens for AI coding agents"
  homepage "https://aiagentflow.dev/canaryhook"
  url "https://registry.npmjs.org/canaryhook/-/canaryhook-0.3.0.tgz"
  sha256 "5e003d34015746fb7b8670e3de56cd7c23be2b614bce5ca51295a1abd425a02f"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"dist/index.js"
    bin.install_symlink libexec/"dist/index.js" => "canaryhook"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/canaryhook --version")
    assert_match "honeyfiles and canary tokens", shell_output("#{bin}/canaryhook --help")
  end
end
