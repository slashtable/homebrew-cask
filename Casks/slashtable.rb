cask "slashtable" do
  version "0.5.8"
  arch arm: "aarch64", intel: "x64"

  sha256 arm:   "a01b54bcc787b6c56e9eb3d06504591e9319fb43d55ecf5a22fa330916d2a161",
         intel: "1ca9ff7fb75a9ba8fa172ac50782061cc399dab21ad948a80fb90f477f9c8663"

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
