class Velos < Formula
  desc "High-performance AI-friendly process manager"
  homepage "https://github.com/Dave93/velos"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-macos-arm64.tar.gz"
      sha256 "d719972a0fdeb7f51faa9428408f6c98e3ed72c472e7a247dee2716b88968b91"
    end
    on_intel do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-macos-x86_64.tar.gz"
      sha256 "890286912c74c36d254035fe9a1b905dbd8960f6ba593554430f6c467313c66c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-linux-arm64.tar.gz"
      sha256 "2de967f1d72a9f2e155ba5d598936db29d30853171ccc66c387b11dc2eb1be74"
    end
    on_intel do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-linux-x86_64.tar.gz"
      sha256 "5d2aab207667fc97b1dd0c9998bfbd087cb0e36cbd9e6d97d072ddf7af918cf7"
    end
  end

  def install
    if OS.mac?
      arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
      bin.install "velos-macos-#{arch}/velos"
    else
      arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
      bin.install "velos-linux-#{arch}/velos"
    end
  end

  test do
    assert_match "velos", shell_output("#{bin}/velos --version")
  end
end
