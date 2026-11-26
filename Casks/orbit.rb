cask "orbit" do
  arch arm: "arm64", intel: "x64"

  version "0.2.3"
  sha256 arm:   "1a644a16dcb60a4d4b4b41db2e490612430248fe458efd5a58f095d2f9a2cf7c",
         intel: "40b3340b1b9c752eb7b7e2f8a9bb7c4edef09958d11d2026ff5029cfb7be93a7"

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
