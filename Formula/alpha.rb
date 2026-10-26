class Alpha < Formula
  desc "CLI tool for managing Patr cloud resources"
  homepage "https://github.com/patr-cloud/patr"
  version "0.18.0-alpha.194"

  conflicts_with "cli", because: "both install the patr binary"
  conflicts_with "beta", because: "both install the patr binary"

  # Homebrew-specific binaries are built with `--features package-managed` so
  # `patr upgrade` and `patr uninstall` hard-refuse and defer to `brew`.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-darwin-arm64-brew.zip"
      sha256 "f2594e7878266c991430c1ab0e7a5220251e587457c9f008d949a2c23ef1d3b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-arm64-brew.tar.gz"
      sha256 "5849056c2cc2078a4b802874cd854d3e3835bc17c740ca2bb24cb0f62c5e49d8"
    else
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-amd64-brew.tar.gz"
      sha256 "5b0ac6e87a8401af892b6166ebe0c1cd7db368ad15af037925171111cd4e9d2c"
    end
  end

  def install
    bin.install "patr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/patr --version")
  end
end
