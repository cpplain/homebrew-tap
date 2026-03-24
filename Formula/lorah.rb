class Lorah < Formula
  desc "Long-running agent harness"
  homepage "https://github.com/cpplain/lorah"
  url "https://github.com/cpplain/lorah/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "81c2226b1b0177d801f78913cc92cdb35231aae16dbbfe0289a84dde9b0696b7"
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
