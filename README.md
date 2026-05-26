# Forge Homebrew Tap

Homebrew tap for [Forge](https://forge-toolkit.vercel.app/) — a native macOS menu-bar productivity toolkit (calendar, clipboard history, window snap, eye-care, screen tools, and more, all behind one icon).

## Install

```sh
brew tap iknahar/forge
brew install --cask forge
```

Or as a one-liner:

```sh
brew install --cask iknahar/forge/forge
```

## First launch

Forge is not yet signed with an Apple Developer ID, so macOS Gatekeeper will block the first launch with:

> "Apple could not verify Forge is free of malware..."

To open it once:

1. Click **Done** on the warning dialog.
2. Open **System Settings → Privacy & Security**.
3. Scroll to **"Forge" was blocked to protect your Mac**, click **Open Anyway**.
4. Launch Forge again, click **Open Anyway** on the final confirmation.

Or skip the dialogs entirely:

```sh
xattr -dr com.apple.quarantine /Applications/Forge.app
```

macOS remembers after the first approval — subsequent launches are silent.

## Update

```sh
brew update
brew upgrade --cask forge
```

## Uninstall

```sh
brew uninstall --cask forge
brew untap iknahar/forge   # optional, removes the tap entirely
```

`brew uninstall --cask --zap forge` also removes preferences, caches, and saved state.

## Source

App source lives at [iknahar/forge-app-source-code](https://github.com/iknahar/forge-app-source-code). DMG releases are attached to tags there.
