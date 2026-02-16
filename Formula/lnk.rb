class Lnk < Formula
  desc "Opinionated symlink manager for dotfiles and more"
  homepage "https://github.com/cpplain/lnk"
  url "https://github.com/cpplain/lnk/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "55d9fa5b454395b76dcff3554b6ad48a8bd8ea9a75331cb9b68ba5e3f56754db"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/lnk"
  end

  test do
    assert_match "lnk #{version}", shell_output("#{bin}/lnk --version")
  end
end
