class Canaryhook < Formula
  desc "Honeyfiles and canary tokens for AI coding agents"
  homepage "https://aiagentflow.dev/canaryhook"
  url "https://registry.npmjs.org/canaryhook/-/canaryhook-0.1.0.tgz"
  sha256 "bfa3af584e0f7f1251d84a5d0dee18170a963eb5055e7c1955bda9e86726cafc"
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
