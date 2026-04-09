class Lorah < Formula
  desc "Long-running agent harness"
  homepage "https://github.com/cpplain/lorah"
  url "https://github.com/cpplain/lorah/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "c94be11f1da0fdffbdad9288bf7da470a74b5e66f0728deff20f0477eadd102e"
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
