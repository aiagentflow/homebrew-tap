class Canaryhook < Formula
  desc "Honeyfiles and canary tokens for AI coding agents"
  homepage "https://aiagentflow.dev/canaryhook"
  url "https://registry.npmjs.org/canaryhook/-/canaryhook-0.4.0.tgz"
  sha256 "bbb9a5f0a849789c09c4fa614fab6401445423b62a0ce22f32f86fc8f74cbd7b"
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
