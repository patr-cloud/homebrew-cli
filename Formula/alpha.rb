class Alpha < Formula
  desc "CLI tool for managing Patr cloud resources"
  homepage "https://github.com/patr-cloud/patr"
  version "0.18.0-alpha.49"

  conflicts_with "cli", because: "both install the patr binary"
  conflicts_with "beta", because: "both install the patr binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-darwin-arm64.zip"
      sha256 "4872d988f4a8e32ec23b0a229d8f458f4a68a9172a60307dcc5a07bfc4db5373"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-arm64.tar.gz"
      sha256 "aecfaf5cbc73e66ee0bd045c9d5f0aebff1ed71fad7567324fbf1a395f8d2ab7"
    else
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-amd64.tar.gz"
      sha256 "3cbeebf1f50e23fce3ab61103a7ec8093bb44c2e180753cb5b365996ba401d18"
    end
  end

  def install
    bin.install "patr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/patr --version")
  end
end
