class Lorah < Formula
  desc "Harness for long-running agents"
  homepage "https://github.com/cpplain/lorah"
  url "https://github.com/cpplain/lorah/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "0a316ea74ced27f760ca5a9691f8762e88db49aacea60b27b1ae8d7b4bc5a31a"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.Version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:), "."
  end

  test do
    assert_match "lorah #{version}", shell_output("#{bin}/lorah -version")
  end
end
