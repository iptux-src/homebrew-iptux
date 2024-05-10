class Iptux < Formula
  desc "Intranet communication tool"
  homepage "https://github.com/iptux-src/iptux"
  url "https://github.com/iptux-src/iptux/archive/v0.9.0.tar.gz"
  sha256 "1f5ccec79655cc786d6de6c2f61c8deb6b8913a2ad1f4c56ac1268536b6e1a2e"
  head "https://github.com/iptux-src/iptux.git"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "appstream" => :build
  depends_on "gettext"
  depends_on "glog"
  depends_on "gtk+3"
  depends_on "gtk-mac-integration" if OS.mac?
  depends_on "jsoncpp"
  depends_on "libsigc++@2"
  depends_on "terminal-notifier" if OS.mac?

  def install
    system "meson", *std_meson_args, "builddir"
    system "ninja", "-C", "builddir", "-v"
    system "ninja", "-C", "builddir", "install", "-v"
  end

  test do
    system bin/"iptux", "--version"
  end
end
