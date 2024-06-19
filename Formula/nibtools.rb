class Nibtools < Formula
  desc "Commodore 1541/1571 disk image nibbler"
  homepage "https://c64preservation.com/dp.php?pg=nibtools"
  url "https://github.com/OpenCBM/nibtools.git", :using => :git, :revision => "master"
  version "2014"
  
  depends_on "cc65" => :build
  depends_on "opencbm" => :build
  depends_on "opencbm"

  def install
    system "make", "-f", "GNU/Makefile", "linux"
    mkdir bin.to_s
    cp %w[nibread nibwrite nibconv nibscan nibrepair nibsrqtest], bin.to_s
  end

  test do
    assert_path_exist("#{bin}/nibread")
    assert_path_exist("#{bin}/nibwrite")
    assert_path_exist("#{bin}/nibconv")
    assert_path_exist("#{bin}/nibscan")
    assert_path_exist("#{bin}/nibrepair")
    assert_path_exist("#{bin}/nibsrqtest")
  end
end
