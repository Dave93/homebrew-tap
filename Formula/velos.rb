class Velos < Formula
  desc "High-performance AI-friendly process manager"
  homepage "https://github.com/Dave93/velos"
  version "0.1.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-macos-arm64.tar.gz"
      sha256 "fdd90d6e90ba7a86603e3d1b3c3ced85d6a925b9aa1571856a3b9c2ea394330e"
    end
    on_intel do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-macos-x86_64.tar.gz"
      sha256 "de2f90733eaedb19ff20e6103e4e9ad4140fc32ca3483b42da26efee3a5d257a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-linux-arm64.tar.gz"
      sha256 "69946bece3620ead26894b22cc2696040db9bda4ec6e9ad31d7d0b11bf151be2"
    end
    on_intel do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-linux-x86_64.tar.gz"
      sha256 "3b4df032fd4db04fbf35e60898f64120d6abd65e999f79cf903a70acb9a85ec0"
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
