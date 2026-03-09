class Lorah < Formula
  desc "Long-running agent harness"
  homepage "https://github.com/cpplain/lorah"
  url "https://github.com/cpplain/lorah/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "e11a4e3f343d4b686d4acb7bf169f856e465ed403950d03e3529207898cf02fc"
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
