class Alpha < Formula
  desc "CLI tool for managing Patr cloud resources"
  homepage "https://github.com/patr-cloud/patr"
  version "0.18.0-alpha.19"

  conflicts_with "cli", because: "both install the patr binary"
  conflicts_with "beta", because: "both install the patr binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-darwin-arm64.zip"
      sha256 "98ce2e0d714b27df23eefb35f4349639a1ab75634e72379b5181682fd94b0f2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-arm64.tar.gz"
      sha256 "7421cf41eaccb687cd843e5439fb07b2835e1fe63931c0d68b79277b838b60fb"
    else
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-amd64.tar.gz"
      sha256 "42bd581735f01c9db95dcc5c90cb9740c952d0ff268b6bd15b8b9bcbd06e4274"
    end
  end

  def install
    bin.install "patr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/patr --version")
  end
end
