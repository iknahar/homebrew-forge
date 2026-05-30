cask "forge" do
  version "1.0.1"
  sha256 "a0f77f0c0a56b3b125d4fff8edfd3a0e504559c3ae789b3d4708258805b69375"

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
