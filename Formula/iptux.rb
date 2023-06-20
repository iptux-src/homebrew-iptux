class Iptux < Formula
  desc "Intranet communication tool"
  homepage "https://github.com/iptux-src/iptux"
  url "https://github.com/iptux-src/iptux/archive/v0.8.4.tar.gz"
  sha256 "b96b6f1f36618d7516af71be19d36ce1fe9f65558b3c95d229399ad91a43b7ec"
  head "https://github.com/iptux-src/iptux.git"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
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
