# typed: false
# frozen_string_literal: true

class Diddo < Formula
  desc "Track your git commits, get AI-powered daily summaries"
  homepage "https://github.com/drugoi/diddo-hooks"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4f5be960da668b8647292e6c5ee9b8fc7778c07ac850132bde6cff5083decb97"
    else
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "8b179ba8aafe7fa891879d974cfb6a9888d4e7fddf69f72b805cedb64b6d50c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f9b3dd64de7e26ea658ae823368ed3a3b7d409a2448b2dc9c0ddb247c3e17ca9"
    else
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27946b631209380e1fe557da66e819f5606c65f82dc7bf7451fc479976d54736"
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
