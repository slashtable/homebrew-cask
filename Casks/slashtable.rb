cask "slashtable" do
  version "0.4.4"
  arch arm: "aarch64", intel: "x64"

  sha256 arm:   "3558fc916a9319677bb1aa15967a3c68daaf967cddc1f86b52d94cdaa445f405",
         intel: "8ca191e5b8fe729c2e41ed26bbe45566a5144a03b6373e9502e8e87399a28956"

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
