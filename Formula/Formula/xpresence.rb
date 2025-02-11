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

  plist_options startup: true

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
        "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>Label</key>
          <string>com.swiftdev12.xpresence</string>
          <key>ProgramArguments</key>
          <array>
            <string>/usr/local/bin/python3</string>
            <string>#{bin}/xcode_rpc.py</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>KeepAlive</key>
          <true/>
        </dict>
      </plist>
    EOS
  end
end

