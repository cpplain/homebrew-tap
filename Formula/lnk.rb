class Lnk < Formula
  desc "Opinionated symlink manager for dotfiles and more"
  homepage "https://github.com/cpplain/lnk"
  url "https://github.com/cpplain/lnk/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "68b0de5f1a6f70c626ea1b11434722c352020662886c4b28e2101b61a6b1dac5"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:), "."
  end

  test do
    assert_match "lnk #{version}", shell_output("#{bin}/lnk --version")
  end
end
