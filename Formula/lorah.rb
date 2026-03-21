class Lorah < Formula
  desc "Long-running agent harness"
  homepage "https://github.com/cpplain/lorah"
  url "https://github.com/cpplain/lorah/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "cb59e48ffb6af0c2ed4c0d0b4585a575c6fbdbe88ffed967205c357c3d8b7296"
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
