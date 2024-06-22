class Iptux < Formula
  desc "Intranet communication tool"
  homepage "https://github.com/iptux-src/iptux"
  url "https://github.com/iptux-src/iptux/archive/v0.9.2.tar.gz"
  sha256 "83692ac4b2a348b281aaebe10af343214781d1a4d548549e3fcd503bc7abc1ef"
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
