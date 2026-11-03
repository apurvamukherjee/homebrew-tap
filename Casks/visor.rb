cask "visor" do
  version :latest
  sha256 :no_check

  url "https://github.com/apurvamukherjee/visor-mac-island/releases/latest/download/Visor.dmg",
      verified: "github.com/apurvamukherjee/visor-mac-island/"
  name "Visor"
  desc "Notch app that puts music, calendar and files where the camera sits"
  homepage "https://apurvamukherjee.github.io/visor-mac-island/"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Visor.app"

  # Builds are self-signed, not notarized, so Gatekeeper would refuse to open them.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Visor.app"]
  end

  zap trash: [
    "~/Library/Caches/com.apurvamukherjee.visor",
    "~/Library/HTTPStorages/com.apurvamukherjee.visor",
    "~/Library/Preferences/com.apurvamukherjee.visor.plist",
  ]
end
