class Llmmemory < Formula
  desc "Long-term memory for AI coding agents"
  homepage "https://aiagentflow.dev/llmmemory"
  url "https://registry.npmjs.org/llmmemory/-/llmmemory-0.2.0.tgz"
  sha256 "7ee3dae796cef2dc1a96e6773b5b025db21b19caad48f9aeb63c40aba203368c"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"dist/index.js"
    bin.install_symlink libexec/"dist/index.js" => "llmmemory"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llmmemory --version")
    assert_match "long-term memory for AI coding agents", shell_output("#{bin}/llmmemory --help")
  end
end
