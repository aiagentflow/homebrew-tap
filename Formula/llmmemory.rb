class Llmmemory < Formula
  desc "Long-term memory for AI coding agents"
  homepage "https://aiagentflow.dev/llmmemory"
  url "https://registry.npmjs.org/llmmemory/-/llmmemory-0.4.0.tgz"
  sha256 "1c4760415ad179a1f9e9ad694370b0b2e15dfc484bda6b337bc3d261471c5fba"
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
