class Velos < Formula
  desc "High-performance AI-friendly process manager"
  homepage "https://github.com/Dave93/velos"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-macos-arm64.tar.gz"
      sha256 "f0156458fbd812f9fcef1f0b7cf4e5a040a9ad78610727067c48e5c6eff36d67"
    end
    on_intel do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-macos-x86_64.tar.gz"
      sha256 "8fba24d9432a27dc31e597c0569079288c1f3f0f82d2da7214877ad201ae407d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-linux-arm64.tar.gz"
      sha256 "4f85b1a1cf2a4e153f7c99d7d2c96e4b6db26cb34edf9df6e994c70e810daabc"
    end
    on_intel do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-linux-x86_64.tar.gz"
      sha256 "5caacf9d4ed5f08008b7a38f94f0066d3a2bfc87f5db66f6bf4fb0e429fbc5ce"
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
