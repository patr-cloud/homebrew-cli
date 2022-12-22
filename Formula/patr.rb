class Patr < Formula
	desc "CLI for interacting with Patr resources"
	homepage "https://github.com/patr-cloud/cli"
	url "https://github.com/patr-cloud/cli/releases/download/v%VERSION%/patr-%VERSION%-darwin-amd64.tar.gz"
	sha256 "%CHECKSUM%"

	def install
		bin.install 'patr'
	end
end