class Superset < Formula
  desc "CLI and host-service for Paradev"
  homepage "https://paradev.com"
  version "2.0.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "29cd764b0964a028b8231ec413e7d6f926287e76a90c4a73086a0c5c2a7cd716"
    end
    on_intel do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-darwin-x64.tar.gz"
      sha256 "802bb653699cd9f982734eef2f17a23109bfe24cb13f4bee87b08de66daa2993"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "6694f466ef3dd9b55551bb4bd39004210e56850771daffbc6e9cd37907270118"
    end
    on_arm do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-linux-arm64.tar.gz"
      sha256 "29adbd5ffa30a98e3dbd3eec7ab212815095ad1f4527b8dea457dbc39277b431"
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
