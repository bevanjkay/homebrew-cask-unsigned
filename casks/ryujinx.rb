cask "ryujinx" do
  version "1.1.0"
  sha256 "2ab00be8ae763cb8e0e9f0c3746609c16e74a36e4d95bbe72a0b0de2862942fd"

  url "https://github.com/Ryujinx/release-channel-macos/releases/download/#{version}-macos1/Ryujinx-#{version}-macos1-macos_universal.app.tar.gz"
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

  zap trash: "~/Library/Saved Application State/org.ryujinx.Ryujinx.savedState"
end
