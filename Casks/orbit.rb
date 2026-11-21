cask "orbit" do
  arch arm: "arm64", intel: "x64"

  version "0.1.7"
  sha256 arm:   "eee04b73735110cd289dd553f67ce0d6bc3227a00de2ed62bbab374cae32d2f4",
         intel: "f4a19ca5778afd7bb76a183995f44943d825b7a9c87925db626f7fb98be2db57"

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
