class Npssh < Formula
  desc "SSH agent with keys in NordPass and Touch ID for every signature"
  homepage "https://github.com/matjaz/npssh"
  url "https://github.com/matjaz/npssh/releases/download/v0.1.0/npssh-0.1.0-darwin-universal.tar.gz"
  version "0.1.0"
  sha256 "f23d8c22619d808d02dc6c3536e15e43d50b266540cca13b6352f09554a1d10b"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :macos

  def install
    bin.install "npssh"
  end

  def caveats
    <<~EOS
      npssh needs the NordPass CLI:
        brew tap nordpass/tap https://downloads.npass.app/cli/homebrew-tap.git
        brew install nordpass/tap/np && np signin

      Start the agent (launchd) and follow the setup it prints:
        npssh install

      After `brew upgrade npssh`, run `npssh install` again so the agent
      restarts on the new version, then `npssh load`.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/npssh version")
  end
end
