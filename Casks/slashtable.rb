cask "slashtable" do
  version "0.5.4"
  arch arm: "aarch64", intel: "x64"

  sha256 arm:   "33b8eb9fc8998b0cd6be5104508ce99e19e0e3ac5b9f93de34246e6ee91ba0b8",
         intel: "dd57933e4e5f3a0617d93dd92f25dfe3802354468e5c3b3ca48ccbb5fbe97baa"

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
