class Velos < Formula
  desc "High-performance AI-friendly process manager"
  homepage "https://github.com/Dave93/velos"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-macos-arm64.tar.gz"
      sha256 "23b0fcf02e14c826644e7b21b1fdf84ba2973a731ec8a67dda97e21c23ec6678"
    end
    on_intel do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-macos-x86_64.tar.gz"
      sha256 "49ea1ce8a84fa6e2cbc3fdeba72badbd24145f5a5693f76445b5225e7fcc6d2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-linux-arm64.tar.gz"
      sha256 "a5a0c4e0ceab293d276958f5b5506f00e99ddb51bba07a56cff6d0a2201ff572"
    end
    on_intel do
      url "https://github.com/Dave93/velos/releases/download/v#{version}/velos-linux-x86_64.tar.gz"
      sha256 "155f4a5333f1a30a06682cbd0892e5d2ce8aa13ca6e805bd1abfc015bc812cac"
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
