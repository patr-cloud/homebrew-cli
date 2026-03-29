class Alpha < Formula
  desc "CLI tool for managing Patr cloud resources"
  homepage "https://github.com/patr-cloud/patr"
  version "0.18.0-alpha.37"

  conflicts_with "cli", because: "both install the patr binary"
  conflicts_with "beta", because: "both install the patr binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-darwin-arm64.zip"
      sha256 "7b8f3f23248cc03955c5ff8149ced6cb73fbf92f87dd135ff40bbde3e40e8d81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-arm64.tar.gz"
      sha256 "970bce58bdaf189b59e88d4003500ec2fa48add00c0fd8c4969d5292b6cd3fd9"
    else
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-amd64.tar.gz"
      sha256 "e60a0ed481f36731df42f408b8f9fd304deb4fb3920a7223a9e6d78b16c3d550"
    end
  end

  def install
    bin.install "patr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/patr --version")
  end
end
