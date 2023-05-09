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
    regex(/Ryujinx[._-]v?(\d+(?:\.\d+)+)[ ._-]/i)
    strategy :github_latest do |json, regex|
      json["assets"]&.map do |asset|
        match = asset["name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  depends_on macos: ">= :big_sur"

  app "Ryujinx.app"

  uninstall quit: "org.ryujinx.Ryujinx"

  zap trash: [
    "~/.config/Ryujinx",
    "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState",
  ]
end
