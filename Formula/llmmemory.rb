class Llmmemory < Formula
  desc "Long-term memory for AI coding agents"
  homepage "https://aiagentflow.dev/llmmemory"
  url "https://registry.npmjs.org/llmmemory/-/llmmemory-0.1.0.tgz"
  sha256 "1fdcf66da6a9efa5a47c4916710eff210a826f90f1817d2dadcbc0b8995d1c10"
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
