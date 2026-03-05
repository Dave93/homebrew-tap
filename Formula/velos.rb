class Velos < Formula
  desc "High-performance AI-friendly process manager"
  homepage "https://github.com/Dave93/velos"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-macos-arm64.tar.gz"
      sha256 "6ae96e599bcfdc4067385f94d92c13916ce4e7873912e061e13041077eb31638"
    end
    on_intel do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-macos-x86_64.tar.gz"
      sha256 "95e6aeff994ec07e273ae790c04d616195d367f6f889cc4207572e3724fbe41b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-linux-arm64.tar.gz"
      sha256 "765793afb8e424670d0cf3f7ca1b1e3356b486de6619624a1a010223c57261f5"
    end
    on_intel do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-linux-x86_64.tar.gz"
      sha256 "1597fe0bab009f4b2b55117467f7c94de84346cfac1a8d2412259921ff9c7a18"
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
