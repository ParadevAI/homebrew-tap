class Superset < Formula
  desc "CLI and host-service for Paradev"
  homepage "https://paradev.com"
  version "2.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-darwin-arm64.tar.gz"
      sha256 "c1c48cdf31edfcbc1faa032a365b14085f98fa0742e7ec0512e85c38328f198b"
    end
    on_intel do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-darwin-x64.tar.gz"
      sha256 "b5c282dd49a1c725e8c3eb9f50107a73b35c9fc2e103af6cfdde998ab93c15f8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-linux-x64.tar.gz"
      sha256 "cee18071a7eab15d06a2b9a2135a87b0e0ceaf3d1c5931358801f32b82cc6bf1"
    end
    on_arm do
      url "https://github.com/paradevai/paradev/releases/download/cli-v#{version}/superset-linux-arm64.tar.gz"
      sha256 "2421949ec8b553b137156c1ad56d94001e7ffd1470ad289229ed06c8167c1c0b"
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
