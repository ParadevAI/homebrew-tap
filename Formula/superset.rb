class Superset < Formula
  desc "CLI and host-service for Paradev"
  homepage "https://superset.sh"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "5fea78a5e75d6f17d3caef7415471064e75e03032f1534d52c4089370d1fb4ad"
    end
    on_intel do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-darwin-x64.tar.gz"
      sha256 "7b4941eecca3b7eb1781add88815da0231714c1a0414d04ba444f8dc4f34089b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "3f193a92d996d39218a2d8379b7b38f2ade41394dbfa1a396af4828f16285939"
    end
    on_arm do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-linux-arm64.tar.gz"
      sha256 "466f5cb5b3a2d283c968b26910db7c2bfb92e4a380b0449d57eee291ca47d08d"
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
