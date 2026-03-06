class Lorah < Formula
  desc "Long-running agent harness"
  homepage "https://github.com/cpplain/lorah"
  url "https://github.com/cpplain/lorah/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "d6edc0c6f1b76d0aedfb6cbb2511b8e9a5c6920677e51b4a66f94f4c1f651692"
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
