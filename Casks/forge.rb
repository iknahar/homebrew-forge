cask "forge" do
  version "1.0.8"
  sha256 "558df3fa75b180d96acb18be0eaf6d517e23feabd9ae7c7ee605055054fadbbf"

  url "https://github.com/iknahar/forge-app-source-code/releases/download/v#{version}/Forge-#{version}.dmg"
  name "Forge"
  desc "Menu-bar productivity toolkit"
  homepage "https://forge-toolkit.vercel.app/"

  depends_on macos: :sonoma

  app "Forge.app"

  zap trash: [
    "~/Library/Application Support/Forge",
    "~/Library/Caches/com.toolkit.forge",
    "~/Library/HTTPStorages/com.toolkit.forge",
    "~/Library/Preferences/com.toolkit.forge.plist",
    "~/Library/Saved Application State/com.toolkit.forge.savedState",
  ]

  # Forge is not yet signed with an Apple Developer ID nor notarized.
  # macOS 14+ Gatekeeper will block first launch with the dialog
  # "Apple could not verify Forge is free of malware". Users should
  # approve it once under System Settings -> Privacy & Security ->
  # "Open Anyway", or strip the quarantine flag manually:
  #
  #   xattr -dr com.apple.quarantine /Applications/Forge.app
  #
  # Once signed + notarized in a future release this caveat goes away.
  caveats <<~EOS
    Forge is not yet notarized by Apple. On first launch macOS will
    block it with "Apple could not verify Forge is free of malware".

    Approve it once:
      System Settings -> Privacy & Security ->
      "Forge was blocked..." -> Open Anyway

    Or strip the quarantine flag from Terminal:
      xattr -dr com.apple.quarantine /Applications/Forge.app
  EOS
end
