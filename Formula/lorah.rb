class Lorah < Formula
  desc "Harness for long-running agents"
  homepage "https://github.com/cpplain/lorah"
  url "https://github.com/cpplain/lorah/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4bfeb542f63f1ea6ac59ba50c12b187f1905f5655d1fd86867e487ff3210474b"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.Version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/lorah"
  end

  test do
    assert_match "lorah #{version}", shell_output("#{bin}/lorah -version")
  end
end
