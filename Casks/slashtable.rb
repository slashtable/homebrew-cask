cask "slashtable" do
  version "0.5.3"
  arch arm: "aarch64", intel: "x64"

  sha256 arm:   "0e5842b715d2753b247c8ff3627f7b4287ad9b61a3932ef691c811962159cc0e",
         intel: "33357562d163e5ff65c8ffdd27ca337b5f7f843d8042585df10449b80d530cf6"

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
