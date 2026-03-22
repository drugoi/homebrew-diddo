# typed: false
# frozen_string_literal: true

class Diddo < Formula
  desc "Track your git commits, get AI-powered daily summaries"
  homepage "https://github.com/drugoi/diddo-hooks"
  version "0.6.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e45ced82d2637c4d75aad441ea3b1f9e30eb6e020f5d8efabbfb84188d735095"
    else
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d1e483f5face7231e5c93787e3dfbdf0be86b4ba870b3c7db3dd6f2fd13449ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ecce6beab4675c43fe36de33fbc74db67828eab3c23d8360d8f0feb0884914ec"
    else
      url "https://github.com/drugoi/diddo-hooks/releases/download/v#{version}/diddo-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "138f63b272f09e6c2a0bb9ea57ec3044750bc6d7e6b62465057c8c07a98abdd7"
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
