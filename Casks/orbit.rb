cask "orbit" do
  arch arm: "arm64", intel: "x64"

  version "0.1.5"
  sha256 arm:   "cb5b9e88720a116c700a9c20a92e0df22a5de6c35c0b3f0210cf3bdfdd236343",
         intel: "31d4e72f83b3bc0e28ead3f23d342209a21b1be33efb634752ea517c5de374ad"

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
