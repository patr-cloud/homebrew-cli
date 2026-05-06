class Alpha < Formula
  desc "CLI tool for managing Patr cloud resources"
  homepage "https://github.com/patr-cloud/patr"
  version "0.18.0-alpha.107"

  conflicts_with "cli", because: "both install the patr binary"
  conflicts_with "beta", because: "both install the patr binary"

  # Homebrew-specific binaries are built with `--features package-managed` so
  # `patr upgrade` and `patr uninstall` hard-refuse and defer to `brew`.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-darwin-arm64-brew.zip"
      sha256 "54801a34da570fe6beadcd8f82a7f3b7cea4e86f0fbd89c2f1bfe8a50856e451"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-arm64-brew.tar.gz"
      sha256 "638ca93d5eba6d6aac39e798c6a61a087ae5ea9e3a701666e88f45cf00907e37"
    else
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-amd64-brew.tar.gz"
      sha256 "14ba6d064c6c5956d8aaf5e8c32b0304fb4239fc1605881b78c183e9f1a96460"
    end
  end

  def install
    bin.install "patr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/patr --version")
  end
end
