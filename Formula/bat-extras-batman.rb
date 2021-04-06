class BatExtrasBatman < Formula
  desc "Read system manual pages using bat as the manual page formatter"
  homepage "https://github.com/eth-p/bat-extras/blob/master/doc/batman.md"
  url "https://github.com/eth-p/bat-extras/archive/v2021.04.06.tar.gz"
  sha256 "c34200445239aa2fbdb45b6bd700831d1156dc61e8745e0cce5675726c0b8317"
  head "https://github.com/eth-p/bat-extras.git"

  depends_on "shfmt" => :build
  depends_on "bat"

  def install
    system "./build.sh", "batman", "--no-verify", "--no-inline", "--minify=all", "--manuals"

    bin.install "bin/batman" => "batman"
    man1.install "man/batman.1"
  end

  test do
    assert_match(/^batman\s+\d{4}\.\d{2}\.\d{2}\b/, shell_output("#{bin}/batman --version 2>&1").lines.first.chomp)
  end
end
