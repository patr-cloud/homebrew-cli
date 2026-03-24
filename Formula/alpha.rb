class Alpha < Formula
  desc "CLI tool for managing Patr cloud resources"
  homepage "https://github.com/patr-cloud/patr"
  version "0.18.0-alpha.18"

  conflicts_with "cli", because: "both install the patr binary"
  conflicts_with "beta", because: "both install the patr binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-darwin-arm64.zip"
      sha256 "31b54a4b4fda2c364dc2ffa29aab5db970de6eb1da2b170893ffd9f866aee40a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-arm64.tar.gz"
      sha256 "a405aab3a98f7d6d069e13c7f7c9d1b818758c0092d16f80d6373e1f82fe40f7"
    else
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-amd64.tar.gz"
      sha256 "c255f643eaee21213230c43c2ebcd95189dfe2a3ca9df1e393982092cb4aa0af"
    end
  end

  def install
    bin.install "patr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/patr --version")
  end
end
