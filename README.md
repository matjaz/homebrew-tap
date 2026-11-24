# matjaz/tap

Homebrew tap for [Findspot](#findspot) and [npssh](#npssh).

```sh
brew install --cask matjaz/tap/findspot
brew install matjaz/tap/npssh
```

## Findspot

Find files and folders in a few keystrokes, from the menu bar or the terminal.

- **App:** open Findspot from Applications; it lives in the menu bar. Press
  ⌥Space (or the shortcut set in Preferences) anywhere to search.
- **Open in a terminal:** in the search panel, ⇧⌘↩ opens the selected folder
  (or the folder containing a file) in iTerm or Terminal, and ⇧⌘1–9 does the
  same for that row. Hold ⇧ to see the shortcuts. macOS keeps ⇧⌘3–5 for
  screenshots unless they are turned off in System Settings › Keyboard.
- **Terminal:** add to your shell's startup file

  ```sh
  eval "$(findspot init zsh)"      # bash: init bash · fish: findspot init fish | source · pwsh: init pwsh
  ```

  `fs` picks a path, `fs cd` jumps to it, `fs open` opens it. ⌃T inserts a
  path below the current directory at the cursor, ⌥C changes into a directory
  below it (in iTerm2, set a Option key to "Esc+" for ⌥C).

Builds are not notarized yet. If macOS refuses to open the app:

```sh
xattr -dr com.apple.quarantine /Applications/Findspot.app
```

Update with `brew upgrade --cask findspot`; remove with
`brew uninstall --cask findspot` (`--zap` also removes preferences).

## npssh

An SSH agent for macOS that keeps your keys in NordPass instead of `~/.ssh`
and asks for Touch ID on every signature. It needs the NordPass CLI, whose tap
is not on GitHub:

```sh
brew tap nordpass/tap https://downloads.npass.app/cli/homebrew-tap.git
brew install nordpass/tap/np matjaz/tap/npssh
npssh install      # starts the agent; follow the setup it prints
```

Usage: [matjaz/npssh](https://github.com/matjaz/npssh). After
`brew upgrade npssh`, run `npssh install` again so the agent restarts on the
new version.
