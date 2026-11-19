class Superset < Formula
  desc "CLI and host-service for Paradev"
  homepage "https://paradev.com"
  version "2.0.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "2e5f68e938f356e3720b4bc14f97e2ebb325ab2269e13da559f917b89f55d013"
    end
    on_intel do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-darwin-x64.tar.gz"
      sha256 "33127cce2a6d98c7244d0ef9731d4fa86d3100bbe1cb9e5ac9a6e9cf6f6ab6b0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "f4cc3dafadfc76e2e3b9ebd2cb34248ce5fd3792abc8413e1f09e0c34ee191c9"
    end
    on_arm do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-linux-arm64.tar.gz"
      sha256 "526fedac333e464a7b0297ffe76e5817d6739a928fdf961ebc782f4aaac2b107"
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
