class Lnk < Formula
  desc "Opinionated symlink manager for dotfiles and more"
  homepage "https://github.com/cpplain/lnk"
  url "https://github.com/cpplain/lnk/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "79dd36b599ac5b6bd9b2c1823dfa471f5366b2a77e85398136612c694db70c2a"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/lnk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lnk --version")
    assert_match "symlink manager", shell_output("#{bin}/lnk --help")
  end
end
