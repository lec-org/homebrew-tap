cask "orbit" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "9ba1df0395c2d95da1808569343826b640f7455583cadc47c252a5d284369183",
         intel: "79bd00fe45068d253d5670cd2f0969400f3a90f3e695eb50ac5eff3a504a1daa"

  url "https://github.com/lec-org/lec-orbit/releases/download/v#{version}/Orbit-#{version}-mac-#{arch}.dmg"
  name "Orbit"
  desc "LEC 软件工作室统一桌面工作台与 LecSSO 原生桌面认证器"
  homepage "https://lec-org.github.io/lec-orbit/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Orbit.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Orbit.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Orbit",
    "~/Library/Preferences/top.lecspace.orbit.plist",
    "~/Library/Saved Application State/top.lecspace.orbit.savedState",
  ]
end
