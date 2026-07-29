class Alpha < Formula
  desc "CLI tool for managing Patr cloud resources"
  homepage "https://github.com/patr-cloud/patr"
  version "0.18.0-alpha.165"

  conflicts_with "cli", because: "both install the patr binary"
  conflicts_with "beta", because: "both install the patr binary"

  # Homebrew-specific binaries are built with `--features package-managed` so
  # `patr upgrade` and `patr uninstall` hard-refuse and defer to `brew`.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-darwin-arm64-brew.zip"
      sha256 "8c98c2bdab63d06486de94f349dea367670751c74b607c96bea3a0c0482da50b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-arm64-brew.tar.gz"
      sha256 "f957cfe714e0ad8528a9946ec140a16288e698480762794a4a17083cb2c32afd"
    else
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-amd64-brew.tar.gz"
      sha256 "9babdeca10f140c1a8d42929872789dd40ad685f0d2f14d791e30e1ccfe410a5"
    end
  end

  def install
    bin.install "patr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/patr --version")
  end
end
