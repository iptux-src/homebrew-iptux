class Iptux < Formula
  desc "Intranet communication tool"
  homepage "https://github.com/iptux-src/iptux"
  url "https://github.com/iptux-src/iptux.git", tag: "v0.9.5"
  sha256 "97c3fd606d1b5da8e675117d007a11bdf392105d485bd92f984eaaff2470033f"
  head do
    url "https://github.com/iptux-src/iptux.git", branch: "main"
    depends_on "gobject-introspection" => :build
  end

  depends_on "appstream" => :build
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
    meson_args = ["-Dstatic-link=true"] unless build.head?
    system "meson", "setup", "builddir", *meson_args.to_a, *std_meson_args
    system "ninja", "-C", "builddir", "-v"
    system "ninja", "-C", "builddir", "install", "-v"
  end

  test do
    system bin/"iptux", "--version"
  end
end
