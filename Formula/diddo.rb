# typed: false
# frozen_string_literal: true

class Diddo < Formula
  desc "Track your git commits, get AI-powered daily summaries"
  homepage "https://github.com/drugoi/diddo-hooks"
  version "0.6.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "18715fd64577d21f23a1539356346cf07d59b2b96afb5c9573d2e8938cc9027b"
    else
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4588b2e9bd80d74e09f0ac48d7c8d6519402de12c36cecb80a210e61db768a2a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "69a138a10ffa6bd75a079fde168e562051be7ca50730132a50b0d9f78f0b10e0"
    else
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d000137f7c661346f5c2a8012df84fd390200da0f569d471bb479370c88a63a"
    end
  end

  def install
    bin.install "diddo"
  end

  test do
    assert_match "diddo", shell_output("#{bin}/diddo --help")
  end

  livecheck do
    url :homepage
    strategy :github_latest
  end
end
