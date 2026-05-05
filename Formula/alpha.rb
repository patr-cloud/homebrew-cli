class Alpha < Formula
  desc "CLI tool for managing Patr cloud resources"
  homepage "https://github.com/patr-cloud/patr"
  version "0.18.0-alpha.104"

  conflicts_with "cli", because: "both install the patr binary"
  conflicts_with "beta", because: "both install the patr binary"

  # Homebrew-specific binaries are built with `--features package-managed` so
  # `patr upgrade` and `patr uninstall` hard-refuse and defer to `brew`.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-darwin-arm64-brew.zip"
      sha256 "3a4fd121f1d5835de4d4cbc0f1d850dc0940d534b6196616a38162e96f790a03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-arm64-brew.tar.gz"
      sha256 "a9dd2f171554f378eaa6c1881f3fc0c16cfbf1b5d82be226067ca509240539d4"
    else
      url "https://github.com/patr-cloud/patr/releases/download/alpha/patr-linux-amd64-brew.tar.gz"
      sha256 "a09ce46825e41822f270ec2740838de5155c0bbd8c7ab0df1021680480cb6fbc"
    end
  end

  def install
    bin.install "patr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/patr --version")
  end
end
