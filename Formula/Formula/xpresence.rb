class Xpresence < Formula
  desc "Discord Rich Presence for Xcode"
  homepage "https://github.com/SwiftDev12/XcodeRPC"
  url "https://github.com/SwiftDev12/XcodeRPC/releases/latest/download/xcode_rpc.tar.gz"
  version "1.0.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  sha256 :auto

  depends_on "python@3.9"

  def install
    bin.install "xcode_rpc.py"
  end

  service do
    run ["/usr/bin/python3", opt_bin/"xcode_rpc.py"]
    keep_alive true
    run_at_load true
    working_dir var
    log_path var/"log/xpresence.log"
    error_log_path var/"log/xpresence.log"
  end
end
