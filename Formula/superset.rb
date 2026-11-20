class Superset < Formula
  desc "CLI and host-service for Paradev"
  homepage "https://paradev.com"
  version "2.0.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "1d1ee4b05ec4ca39db1dedd5d9ab4be384b31dcb30fba9f78a3a06e3b25a31f0"
    end
    on_intel do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-darwin-x64.tar.gz"
      sha256 "15ba6b237babf57c74d5c0b0c52c62a4be9780e69e01963fd49151c21c5d5d98"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "dd9869a07a11bd074e7d757762a94292f67a534905c9a00fc04aeb7a2ca2f40b"
    end
    on_arm do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-linux-arm64.tar.gz"
      sha256 "1c7f90e1974bcd7d7017007d6905156c3c0c1944e36f9706af37e462158f3750"
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
