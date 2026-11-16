class Superset < Formula
  desc "CLI and host-service for Paradev"
  homepage "https://paradev.com"
  version "2.0.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "b55ad1082a4b5548c34afc2dfd534f949e10d365b2bdcbfca40acddf774997c3"
    end
    on_intel do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-darwin-x64.tar.gz"
      sha256 "9c149eae8248745631d895f07461981ae3c571555d70a4c0706d8879cccc7cab"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "a26779e7c525ed7d207050a50a800b92b8a22f21097a4199f5e1078fc92e0fcb"
    end
    on_arm do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-linux-arm64.tar.gz"
      sha256 "e3ddb1f82e96d97d06601c5401a945d6b0bdbaaa2ba832c5a8c3bb827bc0872c"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/superset"
    bin.install_symlink libexec/"bin/superset-host"
    bin.install_symlink libexec/"bin/superset" => "paradev"
  end

  test do
    assert_match "superset", shell_output("#{bin}/superset --version")
    assert_match "superset", shell_output("#{bin}/paradev --version")
  end
end
