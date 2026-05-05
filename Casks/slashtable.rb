cask "slashtable" do
  version "0.5.10"
  arch arm: "aarch64", intel: "x64"

  sha256 arm:   "a9658edd3cb4e17632aca7bb24f5e13e52ac1bbc891a77f08e815028ba87a6fd",
         intel: "9918c3d12d9d4de9d890155cbe4d89d0b48cac7fbd30de998835abe81596e013"

  url "https://downloads.slashtable.dev/v#{version}/SlashTable_#{version}_#{arch}.dmg"

  name "SlashTable"
  desc "Database browser and MCP server"
  homepage "https://slashtable.dev"

  livecheck do
    url "https://downloads.slashtable.dev/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: ">= :ventura"

  app "SlashTable.app"

  zap trash: [
    "~/.slashtable",
    "~/Library/Caches/com.slashtable.app",
    "~/Library/Caches/dev.slashtable",
    "~/Library/Caches/slashtable",
    "~/Library/Preferences/dev.slashtable.plist",
    "~/Library/Preferences/slashtable.plist",
    "~/Library/WebKit/com.slashtable.app",
    "~/Library/WebKit/dev.slashtable",
    "~/Library/WebKit/slashtable",
  ]
end
