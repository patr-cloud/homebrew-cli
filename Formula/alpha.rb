class Alpha < Formula
  desc "CLI tool for managing Patr cloud resources"
  homepage "https://github.com/patr-cloud/patr"
  version "0.18.0-alpha.41"

  conflicts_with "cli", because: "both install the patr binary"
  conflicts_with "beta", because: "both install the patr binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-darwin-arm64.zip"
      sha256 "58f228731af28bc8a91aeb292f6eb5326fe4e9bb25a20e72884910aace4b904e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-arm64.tar.gz"
      sha256 "927829807de066814c566a5553f4d9d9942dafc018f83104b3406df84bee0436"
    else
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-amd64.tar.gz"
      sha256 "8d167cd312b3cd842a96be3b50d94d63b8cf91293c1b4aab60738e6d3cc6d95d"
    end
  end

  def install
    bin.install "patr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/patr --version")
  end
end
