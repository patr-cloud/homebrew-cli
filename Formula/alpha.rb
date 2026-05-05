class Alpha < Formula
  desc "CLI tool for managing Patr cloud resources"
  homepage "https://github.com/patr-cloud/patr"
  version "0.18.0-alpha.103"

  conflicts_with "cli", because: "both install the patr binary"
  conflicts_with "beta", because: "both install the patr binary"

  # Homebrew-specific binaries are built with `--features package-managed` so
  # `patr upgrade` and `patr uninstall` hard-refuse and defer to `brew`.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-darwin-arm64-brew.zip"
      sha256 "7dce428732a532edcb24f68081c4a7669e667c90085805e07e79d4d0038f6f5b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-arm64-brew.tar.gz"
      sha256 "1a144550610cd5e1e1e28a0c9e46e0e3aabeaf64ca1df69e0e282e108ed883bf"
    else
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-amd64-brew.tar.gz"
      sha256 "87c4fa70f14356f4d78f1b3a1b1c94b75bc56824e780aef176d98e41de23770f"
    end
  end

  def install
    bin.install "patr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/patr --version")
  end
end
