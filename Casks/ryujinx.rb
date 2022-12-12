cask "ryujinx" do
  version "1.1.0"
  sha256 "259d56bbded1940fb227e01d0e8c0b4ad68dc8f8953f19a6414485427d9c7ae9"

  url "https://github.com/Ryujinx/release-channel-macos/releases/download/#{version}-macos1/Ryujinx-#{version}-macos1-macos_universal.app.tar.gz",
      verified: "github.com/Ryujinx/release-channel-macos/"
  name "Ryujinx"
  desc "Nintendo Switch emulator"
  homepage "https://ryujinx.org/"

  livecheck do
    url :url
    regex(%r{href=["']?[^"' >]*?/tag/v?(\d+(?:\.\d+)+)[._-]macos.*?["' >]}i)
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Ryujinx.app"

  uninstall quit: "org.ryujinx.Ryujinx"

  zap trash: [
    "~/.config/Ryujinx",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
