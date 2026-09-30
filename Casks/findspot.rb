cask "findspot" do
  version "0.2.0"
  sha256 "4fb9a700a6e5dfb0299d7d3b31c143174d439901ef873065bc738ee471278447"

  url "https://github.com/matjaz/homebrew-tap/releases/download/findspot-v#{version}/Findspot-#{version}.dmg"
  name "Findspot"
  desc "Find files and folders in a few keystrokes, from the menu bar or the terminal"
  homepage "https://github.com/matjaz/homebrew-tap"

  livecheck do
    url :url
    regex(/^findspot[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on macos: :ventura

  app "Findspot.app"
  binary "#{appdir}/Findspot.app/Contents/Helpers/findspot"

  uninstall quit: "si.lipus.findspot"

  zap trash: "~/Library/Preferences/si.lipus.findspot.plist"

  caveats <<~EOS
    This build is not notarized. If macOS refuses to open it, run:
      xattr -dr com.apple.quarantine #{appdir}/Findspot.app

    For the `fs` shell function add to your shell's startup file:
      eval "$(findspot init zsh)"      # or: bash, fish (findspot init fish | source), pwsh
  EOS
end
