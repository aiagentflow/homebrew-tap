class Llmmemory < Formula
  desc "Long-term memory for AI coding agents"
  homepage "https://aiagentflow.dev/llmmemory"
  url "https://registry.npmjs.org/llmmemory/-/llmmemory-0.3.0.tgz"
  sha256 "b1556654b69a81c3152cd9c6528184a579e2901dcab3149c49835ebc618c545c"
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
